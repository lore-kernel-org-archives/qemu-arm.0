Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5445CC44515
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 13:16:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wlnqo-0005Um-RW; Mon, 20 Jul 2026 09:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wlnqh-0005TW-RG
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 09:16:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wlnqZ-0000kx-E7
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 09:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784553350;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LeFvv4vW522KiMO6d4ucU+gkG8SLOOlJmgZ+kxNXCO0=;
 b=DgfXWh7UPtYUhdtkgGQ90Yu1WuudlgBiLwz/tdbLcVk+wP3vNlO/CE0WArbB1wQRpqEmPS
 fatlBAWSzSwXssdKti69Q9GrImaInlA+sczM/H179PefOqEzML37NsODFmi9ZXub2obsRi
 6WwvSAQYPFLiwwdJPlG3zLkXWmsJ4pM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-oV8YWR-BMaCobioiNx0BZQ-1; Mon, 20 Jul 2026 09:15:46 -0400
X-MC-Unique: oV8YWR-BMaCobioiNx0BZQ-1
X-Mimecast-MFC-AGG-ID: oV8YWR-BMaCobioiNx0BZQ_1784553345
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-47f70d735a4so1224895f8f.2
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 06:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784553345; x=1785158145;
 h=in-reply-to:from:references:cc:to:content-language:subject:reply-to
 :user-agent:mime-version:date:message-id:content-type:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=oijZpy0r1VzYO2DKpyxRi2ubhcnDdCh9TTKC8oCUQT0=;
 b=mnNs9ahrOylbMBUaX7eArSBEhKYhWMD6rV/AQUTHmTa7sloix6YZhDikgyj847tPOT
 i8OzQ9nAhdgyV8QCcp8DD7U2N+H7zg7uVNF71uJy+v0g07Utamqj5m6Cp3QMm4vwvPQb
 SPRqSzhQoahIpJqktb2vBnrXDxr5r2sMKyWm4keQZsXkDG/JngweI+BH+IYOORK1Lf7t
 X/yqVCXhdb3L2JX9sQutUVSCAEdLHotDR5mlXtnO29hc5wbqNI2N1V+pqCI9G9lDHUFd
 KHAfSP3iKZjMyPHGZRF9Xwh5SYTHa1kBitLf4MFfGknw9pvymhvc5asvGiPNVi38qGOe
 6Zcg==
X-Forwarded-Encrypted: i=1;
 AHgh+RorsYcPw6oxNlIiUHb8ok4kCqSiyYVPUihVwhwxkl0OZe2MsA2SPsaeNvwtPSbmjT+dUJmV3O54jg==@nongnu.org
X-Gm-Message-State: AOJu0YyUTZZlbFgzkS+j05OZwfZm11uPJEuOtsFGbK57jTi9PeOoAUCB
 GF9QfYg9Pwi7fuDkDZ526ZMF9ThYf/hKbv++bN97bNiB9xEIz4RYsrKsEmgqu3gperYErqiL7d+
 K3VJEgyXdF6lMDQJsV62y0qastVowAPA0fdEQTIX0xc9Y/L9IVRPSTg==
X-Gm-Gg: AR+sD10jAcafy2rFexXyZPrXCRISLsOR2jLeV7ZQigqJ00wMrXIuSF0njJNe73rnFuG
 HlD2Y8bKfB+vMArH92ewqUmJUaHyB6epV2WAaAX++Ux3fInM/m7OUK21RG74pJ8IOjwGRVDPWYt
 whv9aFvth4bpllnKqkvcdZxvZIVn7TWfa3fNRctfB2KbtUTiOUoNQp26bzczMlmAtyBJZe/jUB6
 wcDlHqYNLH/ow2zpQPbjuyE5ESKfF28QVDXN9nvCnR5Iwm2owh9iXxrLxoehoyTIZb3v/5fd7OS
 l/a3xSeQkBfSx7cA8b0PHFZ0yyMCvZkw7uvhUN9DLMQKKWDnj5o9mkxJNZ7Y11PXhyKe4sYtNwY
 qtK8SEmVWehOdp/YGeLyJ4l2noYubv0gZZSSY7FNTVjASvLZE
X-Received: by 2002:a05:6000:614:b0:47f:7050:5026 with SMTP id
 ffacd0b85a97d-47f705050cfmr8625429f8f.38.1784553345076; 
 Mon, 20 Jul 2026 06:15:45 -0700 (PDT)
X-Received: by 2002:a05:6000:614:b0:47f:7050:5026 with SMTP id
 ffacd0b85a97d-47f705050cfmr8625352f8f.38.1784553344552; 
 Mon, 20 Jul 2026 06:15:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ec7f55sm26831988f8f.18.2026.07.20.06.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 06:15:43 -0700 (PDT)
Message-ID: <4fa419a7-f9aa-4e9a-885b-0f8caccee617@redhat.com>
Date: Mon, 20 Jul 2026 15:15:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 08/17] target/arm/cpu-idregs.h.inc: Generate enum
 values
To: Khushit Shah <khushit.shah@nutanix.com>
Cc: "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Shaju Abraham <shaju.abraham@nutanix.com>,
 "yangjinqian1@huawei.com" <yangjinqian1@huawei.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "skolothumtho@nvidia.com" <skolothumtho@nvidia.com>,
 "philmd@linaro.org" <philmd@linaro.org>, "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260616132625.1732031-1-eric.auger@redhat.com>
 <20260616132625.1732031-9-eric.auger@redhat.com>
 <F517E5C6-EF76-4D2A-97E8-6C232E3CE3DB@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <F517E5C6-EF76-4D2A-97E8-6C232E3CE3DB@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vZ0Gj7ou57qGC_LteXL7w_HEock1zjfGxCLMln9EIbY_1784553345
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------5B5aiQH5eCUmr0rD6ADLKZ3M"
Content-Language: en-US
Received-SPF: permerror client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

This is a multi-part message in MIME format.
--------------5B5aiQH5eCUmr0rD6ADLKZ3M
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kushit,

On 6/19/26 8:28 AM, Khushit Shah wrote:
> From f0e489cebdac1ba94b8082bc240f2d889555f7ea Mon Sep 17 00:00:00 2001
> From: Khushit Shah <khushit.shah@nutanix.com>
> Date: Fri, 19 Jun 2026 11:54:29 +0530
> Subject: [PATCH] scripts: bug fixes in update-aarch64-cpu-sysreg-properties
>
> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com>
> ---
> While rebasing I found two bugs here:
> - It outputs incorrect value for field that defined a ValueRange.
>    For example, CTX_CMPs (and all similar fields).
I attached the diff it generates. I am not sure this is exactly what we
want. 

for ValueRange such as SMIDR_EL1.HIP

                          "_type": "Values.ValueRange",
                          "end": {
                            "_type": "Values.Value",
                            "meaning": null,
                            "value": "'1111'"
                          },
                          "meaning": null,
                          "start": {
                            "_type": "Values.Value",
                            "meaning": null,
                            "value": "'0001'"

I guess you want all values between 1 and 15
whereas the script currently generates a single value.

Also in the diff I don't see any wrong parsing of 

"decimal 10 might be incorrectly parsed as to 2" fixed by the script. Nevertheless can be a proper issue

Thanks

Eric

> - decimal 10 might be incorrectly parsed as to 2.
>
> Sending inline patch that I have added.
> ---
>  .../update-aarch64-cpu-sysreg-properties.py   | 56 ++++++++++++-------
>  1 file changed, 35 insertions(+), 21 deletions(-)
>  mode change 100644 => 100755 scripts/update-aarch64-cpu-sysreg-properties.py
>
> diff --git a/scripts/update-aarch64-cpu-sysreg-properties.py b/scripts/update-aarch64-cpu-sysreg-properties.py
> old mode 100644
> new mode 100755
> index 9e829fda2e..2e28b03598
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
> --
> 2.52.0
>
>
>

--------------5B5aiQH5eCUmr0rD6ADLKZ3M
Content-Type: text/x-patch; charset=UTF-8; name="cpu-idregs.h.inc.diff"
Content-Disposition: attachment; filename="cpu-idregs.h.inc.diff"
Content-Transfer-Encoding: base64

LS0tIHRhcmdldC9hcm0vY3B1LWlkcmVncy5oLmluYwkyMDI2LTA3LTIwIDE0OjQ0OjQzLjE3NDYw
Mzc0MSArMDIwMAorKysgdGFyZ2V0L2FybS9jcHUtaWRyZWdzLmguaW5jLnJlZAkyMDI2LTA3LTIw
IDE0OjQ0OjA3LjkxNzg5MDcxMiArMDIwMApAQCAtMTMzLDEzICsxMzMsMTcgQEAKICAgICAgICAg
SURSRUdfRklFTERfQVJDSF9WQUwoNSkKICAgICAgICAgSURSRUdfRklFTERfQVJDSF9WQUwoNikK
ICAgICBJRFJFR19GSUVMRF9FTkQoSURfQUE2NERGUjBfRUwxLCBQTVNWZXIpCi0gICAgSURSRUdf
RklFTEQoSURfQUE2NERGUjBfRUwxLCBDVFhfQ01QcywgMjgsIDQpCisgICAgSURSRUdfRklFTERf
U1RBUlQoSURfQUE2NERGUjBfRUwxLCBDVFhfQ01QcywgMjgsIDQpCisgICAgICAgIElEUkVHX0ZJ
RUxEX0FSQ0hfVkFMKDE1KQorICAgIElEUkVHX0ZJRUxEX0VORChJRF9BQTY0REZSMF9FTDEsIENU
WF9DTVBzKQogICAgIElEUkVHX0ZJRUxEKElEX0FBNjRERlIwX0VMMSwgV1JQcywgMjAsIDQpCiAg
ICAgSURSRUdfRklFTERfU1RBUlQoSURfQUE2NERGUjBfRUwxLCBQTVNTLCAxNiwgNCkKICAgICAg
ICAgSURSRUdfRklFTERfQVJDSF9WQUwoMCkKICAgICAgICAgSURSRUdfRklFTERfQVJDSF9WQUwo
MSkKICAgICBJRFJFR19GSUVMRF9FTkQoSURfQUE2NERGUjBfRUwxLCBQTVNTKQotICAgIElEUkVH
X0ZJRUxEKElEX0FBNjRERlIwX0VMMSwgQlJQcywgMTIsIDQpCisgICAgSURSRUdfRklFTERfU1RB
UlQoSURfQUE2NERGUjBfRUwxLCBCUlBzLCAxMiwgNCkKKyAgICAgICAgSURSRUdfRklFTERfQVJD
SF9WQUwoMTUpCisgICAgSURSRUdfRklFTERfRU5EKElEX0FBNjRERlIwX0VMMSwgQlJQcykKICAg
ICBJRFJFR19GSUVMRF9TVEFSVChJRF9BQTY0REZSMF9FTDEsIFBNVVZlciwgOCwgNCkKICAgICAg
ICAgSURSRUdfRklFTERfQVJDSF9WQUwoMCkKICAgICAgICAgSURSRUdfRklFTERfQVJDSF9WQUwo
MSkKQEAgLTE5Miw5ICsxOTYsMTUgQEAKICAgICAgICAgSURSRUdfRklFTERfQVJDSF9WQUwoMSkK
ICAgICAgICAgSURSRUdfRklFTERfQVJDSF9WQUwoMikKICAgICBJRFJFR19GSUVMRF9FTkQoSURf
QUE2NERGUjFfRUwxLCBTUE1VKQotICAgIElEUkVHX0ZJRUxEKElEX0FBNjRERlIxX0VMMSwgQ1RY
X0NNUHMsIDI0LCA4KQotICAgIElEUkVHX0ZJRUxEKElEX0FBNjRERlIxX0VMMSwgV1JQcywgMTYs
IDgpCi0gICAgSURSRUdfRklFTEQoSURfQUE2NERGUjFfRUwxLCBCUlBzLCA4LCA4KQorICAgIElE
UkVHX0ZJRUxEX1NUQVJUKElEX0FBNjRERlIxX0VMMSwgQ1RYX0NNUHMsIDI0LCA4KQorICAgICAg
ICBJRFJFR19GSUVMRF9BUkNIX1ZBTCgwKQorICAgIElEUkVHX0ZJRUxEX0VORChJRF9BQTY0REZS
MV9FTDEsIENUWF9DTVBzKQorICAgIElEUkVHX0ZJRUxEX1NUQVJUKElEX0FBNjRERlIxX0VMMSwg
V1JQcywgMTYsIDgpCisgICAgICAgIElEUkVHX0ZJRUxEX0FSQ0hfVkFMKDApCisgICAgSURSRUdf
RklFTERfRU5EKElEX0FBNjRERlIxX0VMMSwgV1JQcykKKyAgICBJRFJFR19GSUVMRF9TVEFSVChJ
RF9BQTY0REZSMV9FTDEsIEJSUHMsIDgsIDgpCisgICAgICAgIElEUkVHX0ZJRUxEX0FSQ0hfVkFM
KDApCisgICAgSURSRUdfRklFTERfRU5EKElEX0FBNjRERlIxX0VMMSwgQlJQcykKICAgICBJRFJF
R19GSUVMRChJRF9BQTY0REZSMV9FTDEsIFNZU1BNVUlELCAwLCA4KQogSURSRUdfRU5EKElEX0FB
NjRERlIxX0VMMSkKIApAQCAtMjA0OSw4ICsyMDU5LDEzIEBACiBJRFJFR19FTkQoUkVWSURSX0VM
MSkKIAogSURSRUdfU1RBUlQoU01JRFJfRUwxKQotICAgIElEUkVHX0ZJRUxEKFNNSURSX0VMMSwg
TlNNQywgNTYsIDQpCi0gICAgSURSRUdfRklFTEQoU01JRFJfRUwxLCBISVAsIDUyLCA0KQorICAg
IElEUkVHX0ZJRUxEX1NUQVJUKFNNSURSX0VMMSwgTlNNQywgNTYsIDQpCisgICAgICAgIElEUkVH
X0ZJRUxEX0FSQ0hfVkFMKDApCisgICAgICAgIElEUkVHX0ZJRUxEX0FSQ0hfVkFMKDE1KQorICAg
IElEUkVHX0ZJRUxEX0VORChTTUlEUl9FTDEsIE5TTUMpCisgICAgSURSRUdfRklFTERfU1RBUlQo
U01JRFJfRUwxLCBISVAsIDUyLCA0KQorICAgICAgICBJRFJFR19GSUVMRF9BUkNIX1ZBTCgwKQor
ICAgIElEUkVHX0ZJRUxEX0VORChTTUlEUl9FTDEsIEhJUCkKICAgICBJRFJFR19GSUVMRChTTUlE
Ul9FTDEsIEFmZmluaXR5MiwgMzIsIDIwKQogICAgIElEUkVHX0ZJRUxEX1NUQVJUKFNNSURSX0VM
MSwgSW1wbGVtZW50ZXIsIDI0LCA4KQogICAgICAgICBJRFJFR19GSUVMRF9BUkNIX1ZBTCgwKQo=

--------------5B5aiQH5eCUmr0rD6ADLKZ3M--


