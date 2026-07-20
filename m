Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AD1C44515
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 14:25:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wlove-0007Kj-4O; Mon, 20 Jul 2026 10:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wlovZ-0007E1-S2
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 10:25:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wlovX-0001em-AH
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 10:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784557502;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XyYskVW5Q3OAyXu3DG/PTzV3maSXjfq/3t1Pihd5U2Y=;
 b=amWZoeCvd9W/r/nDnjbb2Hfoq1NOKLEsVJ06U0vM9mkq1rVcZebofdpZb1uKSVnFX3XOcd
 GC4FHCep7LJV7eUv3LyxC8RFspUnlJ/Rbv+B90U9B61H9BpocpB9yv2HgFLGlqlURfCZQn
 nBT1nPX/OYK6tei/i4y/hxe9lpHC/Xk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-zfNShkUUOt6lBG4h7kXOOA-1; Mon, 20 Jul 2026 10:25:00 -0400
X-MC-Unique: zfNShkUUOt6lBG4h7kXOOA-1
X-Mimecast-MFC-AGG-ID: zfNShkUUOt6lBG4h7kXOOA_1784557500
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4955b84e25eso12247405e9.1
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 07:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784557499; x=1785162299;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XyYskVW5Q3OAyXu3DG/PTzV3maSXjfq/3t1Pihd5U2Y=;
 b=Q46mss3+aIsEj/RylU98SPSUwZeUlcwKiswyc7EGJlvCkqqLk3lQ/MiP+nfhAq8J4p
 R2pGEuKD3KNW4J1PAWieDZA2ylSpG/9eAzQH99eTaXiesTjgGHF3nF8AqImlUquWKrI7
 +/BH43OIsBZ2NEVY/DlNSiP+ioH5cqEV4EYb5hP8ryMlstI7zae+5HX7tLfojkqLUAD0
 P4W+aPoCLsyhjjXdeUeEU9V0HFzajcULMlAng6zkshyRQ+VAaXTyeYbonCtMSLqGkXLh
 aAB8DLmvPlQYT81Gx9xa//pdquEjR39ypoVApoLkhAohXCwhP2lW4Cmhsev3x9dvhZWE
 D9BQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpIeQTn23qp8lf8JecIMWIu5jn55YEo9obmX/FKLSmOI8MbPDJDQwWWoOLLv9PaV4lzkcPesnbY6g==@nongnu.org
X-Gm-Message-State: AOJu0YxKYL+hIk38+yjuQ9cVOZp02r7V4FSGW9sUFBiKPO3xKNC6Ep/0
 PYWi3Axtw/T6lDVgGX6X99wkqhMmmzfz82/WCiRl/zUX5nFFllEipgMcgFNOnZUaONOrgf9FdIK
 gcLwmVBzKaby6fqbAay+oCLSXdn4EKd6vGbCGslr41Occ7PNg7QY87g==
X-Gm-Gg: AfdE7ckIpQLQHkz0ZlG30EKh+HxkUbs8ILtsdYD9RW8mG6zq1W0sPPF7cjxD3xHt4iy
 bx2FcbAWjKw0qEE7aWcHvr4a5JLMSZEDmcBjTB6j1SjSUvqVDM6P8FwiPk7aoLA14sfrDKk1scn
 p/xOde0gpBj3K2kDhW05lN20HUs7lkh9/rtY/xXNq3PCk4NhhEwe3OwQnN4yhDKVVn5gfZCKFqe
 OpOCvb+OdlaAcUyjW5W1lQcqVkQ6lsXH7O9QqEvTkLA2vjMMGMqY5pmdTx8c+Is5PDAkI937waE
 bYwbF3pbulIVVrS2+a1SYqJc5bArjk98OXGqYakTDoPtOJKjlEMUPv7376VXLlvKF15+DNfKYvJ
 iVOn2pRyZ/L6yXzn96Lkz/NgfFEoVcX7LUlQIgUbWScq30WnF
X-Received: by 2002:a05:600c:4755:b0:495:4a34:16e3 with SMTP id
 5b1f17b1804b1-4954a3d0d04mr170863895e9.1.1784557499400; 
 Mon, 20 Jul 2026 07:24:59 -0700 (PDT)
X-Received: by 2002:a05:600c:4755:b0:495:4a34:16e3 with SMTP id
 5b1f17b1804b1-4954a3d0d04mr170863575e9.1.1784557498880; 
 Mon, 20 Jul 2026 07:24:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4954a2aa698sm261654155e9.4.2026.07.20.07.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 07:24:57 -0700 (PDT)
Message-ID: <b839f20a-da50-493c-9b71-78069b62b867@redhat.com>
Date: Mon, 20 Jul 2026 16:24:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 02/19] scripts: bug fixes in
 update-aarch64-cpu-sysreg-properties
To: Khushit Shah <khushit.shah@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev
Cc: cohuck@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 gshan@redhat.com, skolothumtho@nvidia.com, sebott@redhat.com,
 armbru@redhat.com, philmd@linaro.org, yangjinqian1@huawei.com,
 shaju.abraham@nutanix.com, mark.caveayland@nutanix.com,
 prerna.saxena@nutanix.com
References: <20260716213858.609699-1-khushit.shah@nutanix.com>
 <20260716213858.609699-3-khushit.shah@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260716213858.609699-3-khushit.shah@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v80n4dL9NJcZOONRCW1Ldccua42JTZ_oDQ75dCaLd_Q_1784557500
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: permerror client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 7/16/26 11:38 PM, Khushit Shah wrote:
> - handle quoted bitstrings  and decimal
> - skip Values.ValueRange entries.
The above is the issue you reported on my v6. See my comment on the
other thread.
> - Emit unique RESx_{lsb} names for reserved fields so no two fields in
>   a register share a name.
The requirement for naming RES field needs to be explained. I understand
that now you expose all fields including those which are not writable it
may be required but at this stage I still fail why this is requested.
> - Emit a dummy 64-bit VAL field for registers with no defined fields,
>   such as AIDR_EL1 and REVIDR_EL1.
This is yet another functional change that could be separate.

Thanks

Eric
>
> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com>
> ---
>  .../update-aarch64-cpu-sysreg-properties.py   | 67 +++++++++++++------
>  1 file changed, 45 insertions(+), 22 deletions(-)
>  mode change 100644 => 100755 scripts/update-aarch64-cpu-sysreg-properties.py
>
> diff --git a/scripts/update-aarch64-cpu-sysreg-properties.py b/scripts/update-aarch64-cpu-sysreg-properties.py
> old mode 100644
> new mode 100755
> index 9e829fda2e..ecc35db528
> --- a/scripts/update-aarch64-cpu-sysreg-properties.py
> +++ b/scripts/update-aarch64-cpu-sysreg-properties.py
> @@ -106,6 +106,29 @@ def collect_fields(item, bit_offset=0):
>  
>      return fields
>  
> +def parse_value_int(raw_val):
> +    if raw_val is None or isinstance(raw_val, bool):
> +        return None
> +
> +    # may already be real number
> +    if isinstance(raw_val, int):
> +        return raw_val
> +
> +    raw_str = str(raw_val).strip()
> +
> +    if "'" in raw_str:
> +        # quoted bitstring like "'0100'"
> +        bits = raw_str.replace("'", "")
> +        try:
> +            return int(bits, 2)
> +        except ValueError:
> +            return None
> +
> +    # unquoted, try decimal
> +    try:
> +        return int(raw_str, 0)
> +    except ValueError:
> +        return None
>  
>  def extract_field_enums(field):
>      enums = []
> @@ -124,32 +147,23 @@ def extract_field_enums(field):
>      if not isinstance(val_entries, list):
>          return enums
>  
> +    # A Values.ValueRange field specifies start and end value for a range.
> +    # Don't enumerate anything for them.
> +    for val_entry in val_entries:
> +        if isinstance(val_entry, dict) and \
> +           val_entry.get("_type") == "Values.ValueRange":
> +               return []
> +
>      for val_entry in val_entries:
>          if not isinstance(val_entry, dict):
>              continue
> -            
> +
>          if val_entry.get("_type") == "Values.Value":
> -            raw_val = val_entry.get("value")
> -            if raw_val is None:
> +            int_val = parse_value_int(val_entry.get("value"))
> +            if int_val is None:
>                  continue
> -                
> -            # some of the values have ' like "'0100'"
> -            raw_val_str = str(raw_val).strip().replace("'", "")
> -            
> -            try:
> -                # convert into bin 
> -                int_val = int(raw_val_str, 2)
> -            except ValueError:
> -                try:
> -                    # Fallback to dec if not bin
> -                    int_val = int(raw_val_str, 0)
> -                except ValueError:
> -                    continue
> -            
> -            enums.append({
> -                'value': int_val
> -            })
> -            
> +            enums.append({'value': int_val})
> +
>      return enums
>  
>  def generate_sysreg_properties_from_registers_json(id_reg_names, raw_json_path):
> @@ -210,7 +224,7 @@ def generate_sysreg_properties_from_registers_json(id_reg_names, raw_json_path):
>                         msb > current_fieldset_fields[unique_key]['msb']:
>                          enums = extract_field_enums(val)
>                          current_fieldset_fields[unique_key] = {
> -                            'raw_name': name,
> +                            'raw_name': unique_key,
>                              'lsb': lsb,
>                              'msb': msb,
>                              'width': width,
> @@ -238,6 +252,15 @@ def generate_sysreg_properties_from_registers_json(id_reg_names, raw_json_path):
>          # Sort decreasing lsbs
>          sorted_fields = sorted(unique_fields.items(),
>                                 key=lambda x: x[1]['lsb'], reverse=True)
> +        if len(sorted_fields) == 0:
> +            # cases like REVIDR_EL1 and AIDR_EL1.
> +            # augment a dummy fields VAL.
> +            sorted_fields.append(('VAL', {
> +                'lsb': 0,
> +                'msb': 63,
> +                'width': 64,
> +                'enums': []
> +            }))
>  
>          for unique_key, bits in sorted_fields:
>              enums_list = bits.get('enums', [])


