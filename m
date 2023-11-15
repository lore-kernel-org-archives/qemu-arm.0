Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2700156ejc;
        Wed, 15 Nov 2023 03:25:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvXAdYrzq/yrgdu1FSDKFrQgPdZri1HmWjNQlKsIc/xz9+qOX96d2ANBF1Tc4ici/NAcOj
X-Received: by 2002:ac8:7f50:0:b0:41e:256c:1c75 with SMTP id g16-20020ac87f50000000b0041e256c1c75mr5183409qtk.61.1700047507950;
        Wed, 15 Nov 2023 03:25:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700047507; cv=none;
        d=google.com; s=arc-20160816;
        b=w5FM7kumEMQaGp1GUaMNOG+ii13GiQaRVmgc0EZ21OQKRmvmdriXYW1VKZwhyzLN4E
         X3vO0NR4bFRaJQLwy+l9KkZQGXZwqJqKMUazUt5K/fHRN0VaXzh3SQUNKRp4N4toL+dp
         smZpZHAwgtHx9HuHqq8IX/lvyoo9QRi2Vypzb94xZStvZEJMHFADMapOw49j2tldyLT7
         3Wr6k3mH5y2wTY5fCMobiH3KUpP6p31RibwBcryavG6ctEJp7wBKRwx5Im7BBZ+HJOxn
         Di9b6di1g6qpUi7v4EL2UMRR1qX1D1xJvTTo9T9Xp9RHStBeflW108A88JPX7hUrZPSb
         LoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0zr9TyJtdwcQX++7CAxr/U8558TDeQJKSrA+9/xzIGY=;
        fh=bCI7qSJccLxAfyLdX8mGn2xHTYKACSABf7Jh7JL9Vmc=;
        b=xdyjfb7/yDXp4yyWRBipBKk6ms83DDq/3F6RkmqevEuU6NR1qJKzukEdRR+jUEbGOn
         PId6f2wrYz9EX2kSsYmIAjbLKzj+zMRoIX337ethjvaXSrP3VecEgry2bpAlFdO8EUnJ
         7faqagZG59BGYQ/yM2pCNJdcBtpJihrabE3BbDOXikrcYMCs0Ic+o9hGag7veGPsVyp6
         CkjMU7aLmvFbmh8tdMEy7GyT25+QsOfUCvmcEsNfC3GGmSrZUpxCybR9B7nN5M28GYAN
         Y2r9ytz93Xgjm2Wkq73qWR1vjRTjekHe/Amk/ekWh8i0Hwde37C4fCEq4pqzZVKqD3du
         8J2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gmgjD+5m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20-20020a05622a019400b004054648ff3bsi8859872qtw.284.2023.11.15.03.25.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 03:25:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gmgjD+5m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3E0X-0008Fe-1I; Wed, 15 Nov 2023 06:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r3E0W-0008FU-4z
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 06:24:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r3E0U-0008BG-JS
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 06:24:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700047469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0zr9TyJtdwcQX++7CAxr/U8558TDeQJKSrA+9/xzIGY=;
 b=gmgjD+5mS6T+piesbb7ka9XZVk11xxFPef3x11j2w6HSRAanLbJoeJsdubZVR7IU2VT5Nt
 EiBbBiFJJ++z9uXT758Wfy+OkrSgpR0k3rGl5A8iE2ee7CEmNrNSNX7iIIqmdFyPAW6Id5
 WCSAUtGqJER3GyRrka9Ie0ODX/TyMAs=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-UWfAcEq4NHCPDTsAVmEbSg-1; Wed, 15 Nov 2023 06:24:27 -0500
X-MC-Unique: UWfAcEq4NHCPDTsAVmEbSg-1
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-5abf640f19aso7964633a12.2
 for <qemu-arm@nongnu.org>; Wed, 15 Nov 2023 03:24:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700047467; x=1700652267;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0zr9TyJtdwcQX++7CAxr/U8558TDeQJKSrA+9/xzIGY=;
 b=f5H/iHBSLMlMywOzoUsmwowY6MVCywlR39tvqgCQtfSfiEfMabQRomCgWnF751Vmiy
 Ql9jIMMu8DbdgJlsqadWS2R68EcfvtRT+9RJOGS3WmbRBxqU3MRb6e473VtLnoMpCS+9
 YF6INDTYmTBm/ZEe77MtflMizGGd3HNn9ng0Y90W7xxDsq947BQUCT0kjf7WTYGssc8L
 hmYSE9JyjxuB9LHV9ZY1uVpVftmDjFHWKI0uioiWatK26zt7zaRVBDiC/Z7a4ICnCM1g
 9ZlPrHTfsJ7TV5divjIoDBS2J6mycMDH5Ikz+qkg69co8PBCqAYfn7rq90xVi1PylwUn
 NGQA==
X-Gm-Message-State: AOJu0YyIA43b4vUaiZDSWiwkcsCiPwIJ5b+O2K6CRuLxc2rNMnt68fDQ
 3SN0MJQZc5boeMPKXKetwBqLQc8VCr1x3POXMvFcbGRmqeRNbfjcseuBRLgiudh5YngLfDTS0ty
 f5PJARk0uS/1X
X-Received: by 2002:a05:6a20:431d:b0:181:16dc:d1ae with SMTP id
 h29-20020a056a20431d00b0018116dcd1aemr16708371pzk.48.1700047466950; 
 Wed, 15 Nov 2023 03:24:26 -0800 (PST)
X-Received: by 2002:a05:6a20:431d:b0:181:16dc:d1ae with SMTP id
 h29-20020a056a20431d00b0018116dcd1aemr16708359pzk.48.1700047466660; 
 Wed, 15 Nov 2023 03:24:26 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 ha24-20020a17090af3d800b002776288537fsm6585213pjb.53.2023.11.15.03.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 03:24:26 -0800 (PST)
Message-ID: <dc3b8e48-1d33-480f-99bc-57e1242db13d@redhat.com>
Date: Wed, 15 Nov 2023 21:24:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/31] target/hppa: Remove object_class_is_abstract()
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 richard.henderson@linaro.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 imammedo@redhat.com, philmd@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-3-gshan@redhat.com>
 <35cae9bd-2240-2399-2212-e12f1683bf90@eik.bme.hu>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <35cae9bd-2240-2399-2212-e12f1683bf90@eik.bme.hu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: X0tEu+Lih/6n

On 11/15/23 21:18, BALATON Zoltan wrote:
> On Wed, 15 Nov 2023, Gavin Shan wrote:
>> No need to check if @oc is abstract because it has been covered
>> by cpu_class_by_name().
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>> target/hppa/cpu.c | 1 -
>> 1 file changed, 1 deletion(-)
>>
>> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
>> index 04de1689d7..fc4d2abad7 100644
>> --- a/target/hppa/cpu.c
>> +++ b/target/hppa/cpu.c
>> @@ -163,7 +163,6 @@ static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
>>     ObjectClass *oc = object_class_by_name(typename);
>>
>>     if (oc &&
>> -        !object_class_is_abstract(oc) &&
>>         object_class_dynamic_cast(oc, TYPE_HPPA_CPU)) {
> 
> Might as well remove the line break as the remaining expression fits in 80 chars.
> 

Yes, but the whole chunk of code will be removed in PATCH[03]. So I think
we needn't the extra effort to adjust the format in PATCH[02]?

Thaks,
Gavin

>>         return oc;
>>     }
>>
> 

