Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp781408njb;
        Tue, 18 Feb 2025 07:53:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUFASFvbNfESjdjWF2zynSspfAdoKSgxxxJejv47Cm/u3tPCPzQbjLMrotMS6w2lVr6vzAi19EU74YGOQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFRuJCNLMPTVLo8cgOX6mIDjiR1o38aXh74xo6hQ5HbUYqJeL0K9hkIrN4tZZKHUq5cVoFl
X-Received: by 2002:a05:620a:17a5:b0:7c0:9f3d:7177 with SMTP id af79cd13be357-7c0b534e954mr492285a.37.1739894034536;
        Tue, 18 Feb 2025 07:53:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739894034; cv=none;
        d=google.com; s=arc-20240605;
        b=RtE0D3yIsCkPQoc19AcRQihSWG90yYe3Q3hZ94R+syQnaUVh3dM2AOFb2UG2rMaLzz
         39vTXpugjur6YFs82Zx0cWeXA0F813LNK5YOWLosLQxV8b2OvlZiP7TZqG+VmaAbH4Db
         3p30cSZ5k+EHZ6ohSXsc+oCJFsd+su8Ywv92Zu+iEU7P/c82thGqx69PUNVFG7PJ5p8h
         t8zo5aE1uGQFnlgogWoGtFZsu7q+/DGZhLFItEgAcyyN9maMRJCz/S2EhjBp57a8MBrQ
         pKxyC6ak12v9WVv2BKa66cRB4jhZfValRTqG7YOY+mOyjNm6FWnvpPFnBkFf53Cl5ju0
         L3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0MrY0o8q7SSkfv+KE4Sd4GzKDRGangjGr9ENyIlSpyo=;
        fh=GFRz2JDs5u2BctfOEPn1KujwYLq44lDHqnU1Qa/fU9U=;
        b=Xhe5YJlme/H0Vo/1Y8N+2qh/uKJ+FFLQUJR54VR2NP3Jl5V+iVf9lyk1AZxz/+xv2u
         XnbwCmjwmH8cQeEeS/FGLaeIzjj21QsG4AGdB0t3PmgZcGEhlpLEADXax23zS/bgYmEe
         GuqX9qxcsJGiqJpYbkylp9nhfKlwEJBsju7/EjB5Q/TX1SJqLGHoAaX5aoo/W9K1yVAH
         YnMHa1HRiwnsni38bfaU1QawzFO+5n6qKOmQ2decVXbEqZL8XbzmUs3dn7aXjzzoT47x
         pc5GubEwSOqEVxO5/jbquvk+3IqCm7IO5/i7bIC/IiMR+4Pkg/OkaqWy5JWvlJhfoIFj
         Ue+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AmPN98Xo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9c1508si109451976d6.330.2025.02.18.07.53.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 07:53:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AmPN98Xo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tkPul-0001ht-Ir; Tue, 18 Feb 2025 10:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tkPue-0001hK-Ej
 for qemu-devel@nongnu.org; Tue, 18 Feb 2025 10:53:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tkPuc-0004Nx-Tr
 for qemu-devel@nongnu.org; Tue, 18 Feb 2025 10:53:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739894010;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0MrY0o8q7SSkfv+KE4Sd4GzKDRGangjGr9ENyIlSpyo=;
 b=AmPN98XookE+ssswx4dGzhq311AjCbGOmV7RoZxRoyLByFG2josChNXvZbyjxyut9FvkY1
 pxvxf1NId56WMC1WsP1YfB6fgkiyc2kgF8ujgYVmntjd+lxheQgWHS9xOlcITuhy4rLKxk
 fe7HaIjEg4hP+bEF0a2Cgg387i4qT9Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-iiUlNNZaPsiTzCqh5HO1VA-1; Tue, 18 Feb 2025 10:53:28 -0500
X-MC-Unique: iiUlNNZaPsiTzCqh5HO1VA-1
X-Mimecast-MFC-AGG-ID: iiUlNNZaPsiTzCqh5HO1VA_1739894008
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38f2ef5f0dbso2079341f8f.2
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2025 07:53:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739894007; x=1740498807;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0MrY0o8q7SSkfv+KE4Sd4GzKDRGangjGr9ENyIlSpyo=;
 b=e+3Vf4sRUG+OlJQ12Mhh1tevPi76qjkjoFCLdJ5gTMtyvSG4DsYCtEjp9Q6E421bR/
 LplTwuoiTQ/S553L0aIpzLkahPjyC0mPp4Hphpabd/0+kRpSn5Kw34dkYn69OeMvdXQ9
 brgrpLbv428MUNm6KM/NrOyEpa9RrRCXR0rUPAwUsJAE9VG2J7FbZjr+32ufzTbKyao0
 opKEWGxFGJOoN+toi8XfUoPTYTWS0I/UdVrxSN6os2VIy4Oms7wMrv/CFtyT01MzTHGB
 WWzUkkdYtuAFWOc1aihsehkeMp0rlUup2v6FtiY8zMBoKp9c4m9eL2Q5jQf7wOLByEiv
 1XNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3PGqpeh6U/89GZPtYh03oBjDP7GU7ZKOgZGIq4VsizHX1bPrC37718Us2bSIP0doafzmybtFk/qA4@nongnu.org
X-Gm-Message-State: AOJu0Yzj/0t8nmXQUDk6fcB2LMcxQUbsxVbMX+e7OysMcnIWcBmn4IMQ
 zGmJ9Ht3SCqqsBgRzSU6m3YnBZrEqmdXltz6z2QaKQMbgwhKJPXs0Tp4Nb004+2qiGbk2skr3yh
 BsP7ZjsJur7YjYx6sjr49x/cj8AGc4jaqwkt45bbXXhD1DejnFev4
X-Gm-Gg: ASbGncum/jd15J8FJAV23se/6IK4/KHD0G985l/m5+rlIuANF17WM9Vx+aEf07NO/cS
 ReBhqNzez3k73e0JjJxNbSNKgnGS3uQH/d+Dz/NMRno4Xe8jHR4qnH9BhLgpve7Kbv1+8rBNJ42
 n2NjotXCpZv6yLREVdKo7rnns5I+UovNoPY0d8E3Ck30gqCIu5qiczh4ECQqa2HuqFlW0H+/MWt
 tP4ONyp7VadSAiLHwqinhGrEaA8Y2xo8YKZSB6B/lqtlG0mAsF8xnAB7A976+3oOXyKrhUji6yL
 4kcTEugjhDXkP7Xo9qA+QzJAO3eh5/i9AOO+KlWb8yp4BYMopXIk
X-Received: by 2002:a5d:64ec:0:b0:38f:47f0:e7b7 with SMTP id
 ffacd0b85a97d-38f47f0e871mr8711195f8f.16.1739894007653; 
 Tue, 18 Feb 2025 07:53:27 -0800 (PST)
X-Received: by 2002:a5d:64ec:0:b0:38f:47f0:e7b7 with SMTP id
 ffacd0b85a97d-38f47f0e871mr8711089f8f.16.1739894006013; 
 Tue, 18 Feb 2025 07:53:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f8115sm15569779f8f.92.2025.02.18.07.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 07:53:25 -0800 (PST)
Message-ID: <07bed04b-e000-42d0-971a-53d96344d658@redhat.com>
Date: Tue, 18 Feb 2025 16:53:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] arm/cpu: Store aa64isar0 into the idregs arrays
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev
References: <20250207110248.1580465-1-cohuck@redhat.com>
 <20250207110248.1580465-4-cohuck@redhat.com>
 <1af2d33f-c876-4c23-afb8-be63447960f4@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <1af2d33f-c876-4c23-afb8-be63447960f4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.423,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 61oi8QJfjify




On 2/7/25 7:46 PM, Richard Henderson wrote:
> On 2/7/25 03:02, Cornelia Huck wrote:
>> -    t = cpu->isar.id_aa64zfr0;
>> +    t = GET_IDREG(idregs, ID_AA64ZFR0);
>>       t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
>>       t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);       /*
>> FEAT_SVE_PMULL128 */
>>       t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);   /*
>> FEAT_SVE_BitPerm */
>> @@ -1252,7 +1262,7 @@ void aarch64_max_tcg_initfn(Object *obj)
>>       t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);      /* FEAT_I8MM */
>>       t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);     /* FEAT_F32MM */
>>       t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);     /* FEAT_F64MM */
>> -    cpu->isar.id_aa64zfr0 = t;
>> +    SET_IDREG(idregs, ID_AA64ZFR0, t);
>
> This doesn't belong to this patch.
Yes my fault, ID_AA64ZFR0 handling can easily be put in a separate patch

Eric
>
>
> r~
>

