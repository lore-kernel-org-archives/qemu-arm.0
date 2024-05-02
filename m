Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp1123603ejy;
        Thu, 2 May 2024 05:09:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXodfLH6z0kBzsIqFP85ncpgS+x6X2fsMpESA+exraG4SpEhlLRTjWu9UQwSS1e9wfVk6yAoaUGTYdUKZQMgw5Dcl/OZgSl
X-Google-Smtp-Source: AGHT+IGpA7OBipClLFDp7MKls7XQyXRJpK48ymgMhpgvocnv+yP+U2KdahvN/vbh01/gtxXTkMSd
X-Received: by 2002:a05:600c:1c22:b0:419:f27f:6b05 with SMTP id j34-20020a05600c1c2200b00419f27f6b05mr3632237wms.8.1714651792456;
        Thu, 02 May 2024 05:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714651792; cv=none;
        d=google.com; s=arc-20160816;
        b=uStKogcwB92Qw7hv0AL/oY/LyiXHKJ0jV2Fx0SiQvcd1OVZXiucMNivZ2wT25p8Z2p
         ioClF58DOg/4xU0RvOiDmCg2fVx8Eg1lDE1FjXxPuqsuCCKFe28XYTQA+tEGpoyuDIod
         6nDGWOiIb6oC5bXji3b8j3y2b+U4zCCOu4PW8C2wIqS5IVCZv55l0u/XyUQUTVqVxOyd
         duQFFsQFxfghDlPGbJ5TT6AF7iegj/zYO4LMXE/V0F+gmn5Xeuaieb1ND0+BZzuY3Mil
         ndL1wmtHLKFVXs4Zo7h8+kFH5VUSaDXs8QxheJPTdjc4uQ3w4qVdVmTUrzfU3UQfNnu1
         nBCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=7N/87FJM4Ol2YLWiY4ZehgBypi3P8LqEp8IaPxDGStE=;
        fh=fyXANHmpHhDKi8Z7Ul0fQ4q1PbMXV1+ad90bs6UABZk=;
        b=Tbbada9P51tLxfZ938xtaX44Zf64FR2mGHr7Qznv1rxnDy5LgqLBurcxGRxJgCVbcD
         VPxiq+jIa7MlWpTcP0ZrvAd4B7rWDdn2/MDNvpVpID4auHDbjQJLg/6RqNsm9mt3TX3L
         F3VfFZ30EX752Ri01LIpt2rkwmwyNgWtyGLymKAEVclaUPSYorwAxSy8UoIln34h/k87
         dT9ctI7xs6Nw/zmTgCEcCXJqhCnOm8A/v27Z3BNhVeptTR/njt6RVc2PzNd/Mi0EkDG5
         VikJI0VB9Qw6GJJaK9Jt5fGzWV5vX/AdQh1cOct0RJyyJegkK1CdovFmWhS1iOE0Gwf7
         wwpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F4exzxba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5-20020adff845000000b00343d96f9037si593133wrq.107.2024.05.02.05.09.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2024 05:09:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F4exzxba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2VFd-0001pQ-Lo; Thu, 02 May 2024 08:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s2VFM-0001az-2T
 for qemu-arm@nongnu.org; Thu, 02 May 2024 08:09:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s2VFK-00005K-Fv
 for qemu-arm@nongnu.org; Thu, 02 May 2024 08:09:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714651745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7N/87FJM4Ol2YLWiY4ZehgBypi3P8LqEp8IaPxDGStE=;
 b=F4exzxbaIKzSJO/HbMtGiLjahTcT3W32TFMRxWfdlaQo9peyopjOHRThJfb2RGZEe7aiwl
 Z+iKUVK/ye2eNnSjbvGRRNjoFWU7HfZfPeTBtdKay2CAFhnLCb03TF01/WsEZl0BI2Fv+/
 b/t0NxedEl75rx/DDsB9Vr4cQyh7bes=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-3nQPRaenM6WGWQjP-YXbeQ-1; Thu, 02 May 2024 08:09:02 -0400
X-MC-Unique: 3nQPRaenM6WGWQjP-YXbeQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-572a866721dso980307a12.1
 for <qemu-arm@nongnu.org>; Thu, 02 May 2024 05:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714651741; x=1715256541;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7N/87FJM4Ol2YLWiY4ZehgBypi3P8LqEp8IaPxDGStE=;
 b=QoW+wU9Aaatdb9v/WoIKIfqZrYWUdd8yVtwfhdLR79Z9BrnMWxHErzftw4RG0xNffE
 +voYhEXxVM+NdB/6uiTvEm1+aiNBkybUXITwD0dZ43smucaJ44g7HmShV/kQCEAUcAK3
 qXgLFfpAZYeBbK/oQVkcTeCxExOIu2ZLIssQ50OLsCOV4V4B+NpQ25vRPW69kgIZ1saB
 p68DJYhGMX3nZKvDdZUB1jLDOtLtKrMQnHOp5wguCETjWcxktj7MPncuArSf88zVdZl9
 lVXteG8eTG/YuMcvxk0PuNMjUgZTNyxD8pq0Mxk0zAOfyjCWS/7ujr1tf8IfGvAc4s5k
 LL1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWENsR6N48P6FdpyWvjbWq7KO8SrCqQrEwAnj88I2vdTRkodvc9+1shADm5TDUXADoj/4BZnho5C1oOmQc723bmoCEI
X-Gm-Message-State: AOJu0YzF8M9bIPSn19WqPu8U8bnCeOPiMloLzfUKDUWMg5C/LfNbxSa0
 INyM4zDcnR6CxgT3EYGi6e2F3RtWcUYniapAetoPz/5AuL2cS9PfaMJoOCqF4Xs+qsgPHlXVv0v
 9x7tdcxVJAZxGNcg/M/2OPLVbxKI5u/tMvEQAPEGDzsAFRBqilg==
X-Received: by 2002:a50:8753:0:b0:572:a468:989e with SMTP id
 19-20020a508753000000b00572a468989emr3143471edv.17.1714651741247; 
 Thu, 02 May 2024 05:09:01 -0700 (PDT)
X-Received: by 2002:a50:8753:0:b0:572:a468:989e with SMTP id
 19-20020a508753000000b00572a468989emr3143449edv.17.1714651740825; 
 Thu, 02 May 2024 05:09:00 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-179-34.web.vodafone.de.
 [109.43.179.34]) by smtp.gmail.com with ESMTPSA id
 a4-20020aa7cf04000000b00572abf81975sm464940edy.52.2024.05.02.05.08.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 05:09:00 -0700 (PDT)
Message-ID: <500cec2c-a598-4185-b275-a1435a848c88@redhat.com>
Date: Thu, 2 May 2024 14:08:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] hw/i386: remove obsolete manual deprecation reason
 string of i440fx machines
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Nicholas Piggin
 <npiggin@gmail.com>, Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clegoate@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org
References: <20240501182759.2934195-1-berrange@redhat.com>
 <20240501182759.2934195-14-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240501182759.2934195-14-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: EbBPluUoDkkm

On 01/05/2024 20.27, Daniel P. Berrangé wrote:
> The automatic deprecation mechanism introduced in the preceeding patches
> will mark every i440fx machine upto and including 2.12 as deprecated. As
> such we can revert the manually added deprecation which was a subset:
> 
>    commit c7437f0ddb8ee45bf96d949ddfcbb7697ae3d415
>    Author: Thomas Huth <thuth@redhat.com>
>    Date:   Fri Oct 6 09:52:47 2023 +0200
> 
>      docs/about: Mark the old pc-i440fx-2.0 - 2.3 machine types as deprecated
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/i386/pc_piix.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 9f92504cc4..4137e03f6f 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -812,7 +812,6 @@ static void pc_i440fx_machine_2_3_options(MachineClass *m)
>   {
>       pc_i440fx_machine_2_4_options(m);
>       m->hw_version = "2.3.0";
> -    m->deprecation_reason = "old and unattended - use a newer version instead";
>       compat_props_add(m->compat_props, hw_compat_2_3, hw_compat_2_3_len);
>       compat_props_add(m->compat_props, pc_compat_2_3, pc_compat_2_3_len);
>   }

This will conflict with Philippe's "hw/i386: Remove deprecated pc-i440fx-2.0 
-> 2.3 machines" patch series (which should easy to resolve, though).

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>

