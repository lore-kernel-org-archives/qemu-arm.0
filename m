Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8628C43458
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 14:05:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wevYs-0001nr-8T; Wed, 01 Jul 2026 10:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wevYq-0001mL-I6
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 10:05:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wevYo-0001Kk-OJ
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 10:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782914705;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lec8VUI2yjzTXicodtt6XfLuullf5XdbBMwWNAy7kqg=;
 b=JcEXWqiKKgmSWxSHIMVjp1EOrnf5ydaE56qsVRWy4QLN6VOwanC3Ie7zHMSu6zB+WgJ6lX
 D/wcDFDoeaB0evqYDrrkfBI7vVuMy6VJK2Iq7VdnWAWCEdlh1FNdyoDV/ZEQK1kmXMtaDH
 ai7xhc1jtsty2d1bwxMHupFWkJVJdC8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-MwTL0hT7MpeeMOBXQspJJw-1; Wed, 01 Jul 2026 10:05:00 -0400
X-MC-Unique: MwTL0hT7MpeeMOBXQspJJw-1
X-Mimecast-MFC-AGG-ID: MwTL0hT7MpeeMOBXQspJJw_1782914699
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5aeb711dff7so321605e87.3
 for <qemu-arm@nongnu.org>; Wed, 01 Jul 2026 07:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782914699; x=1783519499;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lec8VUI2yjzTXicodtt6XfLuullf5XdbBMwWNAy7kqg=;
 b=LAyJX/Z37ip/rBfKUpcQ7YbAel1SQng53MT6AnqGwK4RXJouk6WZEushSEMMBAYZOd
 XoyD0ckesdUH0ObyCncdKyANE5opINzxlvprcFzVq/Xib6vApTZ1yRghJWdqDTnWM6gr
 KxZkIbkObcmveaalr7vHrN7udJhE0KQXI3RgctUwb4S9QB5YVGkAd0alBhHqlDoE+4/7
 c7NlMpiXPfK9n9DoC0egtoI7Q4W5kszjYCA88g8HLH53DCRypHcIgHOQJokkcrQgmyhG
 vBr6p8Bhgf4BJ6SVVpBeO3GMz85nLbAAtfiVczq1MySBzbkbpY/YTO0fjP1Jv45LmLPz
 gIGA==
X-Forwarded-Encrypted: i=1;
 AHgh+RogXr40yP4PkB8hgXN0izAvrFxC8DUfasbnAGz1VCHybJ/mpjQMEpqFZM/MrXfL1OzgtfGcCJkUUg==@nongnu.org
X-Gm-Message-State: AOJu0Yw7KwR+/732/JcqG9j0kd8txC1U9axDPlKphBbKrjPYaKniuo7g
 nb/+NLakQJRYT7Kd/vr6jv4n8bpZvxXunGWjukO9CgizU/9Agz3Yzj4VbYPeMJJmUBkErcpBMwN
 ZvC5vh403O29S1hBX6hfE+/0/dhm8mVZXPHsIRechnZcUhv6+iFgmoA==
X-Gm-Gg: AfdE7cmS4Sw6fCSIKYwdSm1nSktmmPtacYXJS44FI7/1RnH3k65gz0QroqbC2jcAqQU
 jfsli/mPV5VpzTbsp+kEBS8saFvWappPCV0E1aLf5tg4XXdxq8BYrtoldp2VALRuDljpD1wv6wz
 /N7EmWSef9HDifTqeFjMHFW3utPxiJa2OzZzY42VPSHmVlsd2/iHumFZk9e4WfEW0rMBEUbdPTi
 yOHPkbS3XIBoVY0/NFLC/fxJ8mcOeBJcSsuo1cj4JwgrRZsSVQH6vqlK/wrDoz7gM04JrnoCDZ/
 K2c2FQe2cmEbRJYrbnr6QAVD39TSEBZ9AWde2kL98jhWINPa3lsaIwaeag3/H9Cy9YKHiYv6wtS
 eAcxZ2tNcSinOgN8/yRGDEArPLuJYWy0B+p7h0SOrJuBvqVEi2siK2DHaHzU=
X-Received: by 2002:a05:6512:31ca:b0:5ae:aaa8:eb21 with SMTP id
 2adb3069b0e04-5aec67a2c1dmr631161e87.14.1782914698907; 
 Wed, 01 Jul 2026 07:04:58 -0700 (PDT)
X-Received: by 2002:a05:6512:31ca:b0:5ae:aaa8:eb21 with SMTP id
 2adb3069b0e04-5aec67a2c1dmr631140e87.14.1782914698392; 
 Wed, 01 Jul 2026 07:04:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5aec8991affsm20145e87.13.2026.07.01.07.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 07:04:57 -0700 (PDT)
Message-ID: <1f338105-9d60-4239-b4aa-fa2e442d338a@redhat.com>
Date: Wed, 1 Jul 2026 16:04:54 +0200
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
X-Mimecast-MFC-PROC-ID: Yc0wF9xnf-rkxwB2Z06A3xfOw0JgYWmtbMIGiUc0r1s_1782914699
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Khushit,

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
> - decimal 10 might be incorrectly parsed as to 2.

OK thanks, I will integrate this in next respin

Eric
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


