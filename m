Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp388715njb;
        Thu, 8 May 2025 05:40:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1H3NnZoxF5S2t6LyPebCMRa530rwkxs3pHnMZPOLNaPDpPiCak0qRTSOPzdgXGR9dZpkEPfCANX0QQg==@linaro.org
X-Google-Smtp-Source: AGHT+IGbWfoSSRYFPOA27cCSnLwfXyX4nsG8bcpAcQWSVozhTlD460ZwIhR1e4TspsDD9g8E57c5
X-Received: by 2002:a05:620a:468d:b0:7c5:3e22:616f with SMTP id af79cd13be357-7caf73a197emr969711385a.21.1746708031239;
        Thu, 08 May 2025 05:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746708031; cv=none;
        d=google.com; s=arc-20240605;
        b=PsT83fFeW9m9DN+djTyMaF6N4X0ySz+FcBhCtwsTDpC1TTVdYD/4y7f399/DmrJkr/
         Pd2EfQSWgCmlJvsu6IbVn6TXk6sgpMqr6oina8zgKiZ5cfOW/eLR9+ckyZhGO5NLxmIz
         SMwVwALTvukD8QVffWK95whM1gHRpRyN8jQ5p8BUqaQDcl33jDDti/jI5//2crwbgHm5
         mSD1ICH7JRaDXHWxYhdoPUwBCpAQepcbWFUXHt/xSpQ2v99evm5EOtLsPgNGlEyhlFdV
         SNAxKnXSw4qaEM4KCh4YZbmBmfYsnQx7vZjo5j7APH5BpuAnnUigMGX1QsCRKhgwvPE4
         Bhwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=TGHmFDkmqOeADXRUbrJSGFdcY2BcLJAM75q2blYOqVw=;
        fh=C1sTCDFhmzorYuCnUYbaYbs6p5ORVo0u278eqipoxkQ=;
        b=Y8ge0qHrHq0kewbUJSuoR36m/oETZNU0zXSp43HJnzTfEcQPHXeIdOQGKIPefhkau5
         Nt/2MzD3oiSFU1J3IWCy/tPD3Ht3ezm149bVJXi1tY5PkUAsu6FGkSJF7I2X+pfNOEL3
         j1n0qX5rTHRIuQpz+wyCjTAD7A6DIjul5pZyb0pSdXk0OZuHY9joL02EQw1YAzzkGX34
         zEtkGsu0UJ3Zo5BUo1OMVXznknue48F8bbh/73uDdPeJyAhbwKmlph22h5QA90P0QECS
         KDbXD1FOO6WG3iskDZ5MeBaeJnFJNx0b9iS5qjMzgBn9NVMb0XEonvfndEhNQm1uK4oj
         YyJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W9upRtVI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49220f83246si45725581cf.1.2025.05.08.05.40.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 05:40:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W9upRtVI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD0Xp-0002Q1-BN; Thu, 08 May 2025 08:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uD0Xm-0002Lz-Si
 for qemu-arm@nongnu.org; Thu, 08 May 2025 08:40:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uD0Xk-0004YR-OF
 for qemu-arm@nongnu.org; Thu, 08 May 2025 08:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746708001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TGHmFDkmqOeADXRUbrJSGFdcY2BcLJAM75q2blYOqVw=;
 b=W9upRtVI/JvwEn8O5Zdmqkn2aU+8EuUH9qDN0+sIG+wJBSrOn994MsFeBaYaGSpivha9Nx
 7uOppZJFHvpfYpsg+fSPcZsqPVR6kdweYbykzvo7O83Fbjzlx2LF4kTi2klSB92m7EhKT9
 KHYr+CjbjPZ8f4mkJknXjqAocL3/IIQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-rT6E5QixOwCfKumfLxeY-Q-1; Thu, 08 May 2025 08:39:59 -0400
X-MC-Unique: rT6E5QixOwCfKumfLxeY-Q-1
X-Mimecast-MFC-AGG-ID: rT6E5QixOwCfKumfLxeY-Q_1746707999
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a0adce033bso365974f8f.2
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 05:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746707998; x=1747312798;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TGHmFDkmqOeADXRUbrJSGFdcY2BcLJAM75q2blYOqVw=;
 b=QW6YFRA+a/W/iUpesScjBDPlGI+QLwMMNit4R2qqKM4MFkpXDTDC3jZXw1HCISz26O
 vrHkkqSEwlw1i07+cyKgxUaNhwDUbIkwXqIepWfmmAP8TmeOgnhdvCy/p6XPXv0OnaAj
 ozwdtVWFO89bcOfDKmwQ1SnKZSvcdkpTQ16g5F5+zo+ByWQynNzs1xWbPZ0i1LHjdGId
 SILhL27YAyWg7NuASZxttUPk+gupt8BZNZEASmwvn4eaif4yU2u/ZeDt1asWhsmlSLb9
 fUrwftuhQay1YpUCjyFqwsq+4qtvf/Zyd93OYrENNnkNNoHxLb6HC62Q94FllTR9hZJM
 r3Jw==
X-Gm-Message-State: AOJu0YzZGYSj7RsPQdTbhsEqV7wswQV5eSKBzDTZUdMe4cbITcRVQd1O
 jJ60c1ZTjkMkLABa7FgVSgyRJiJ68KOrxddc0+GRLAQEmbWjIYVSppuZsbqFiYE/ZkfuWu+JoMY
 Va/6aEJ/6b2jUAJJ0AsG/5YVVwu9cLpV1riNsqzHiWGDwmNiYnQ==
X-Gm-Gg: ASbGncs/uiv4/N0JWrw3vIcBehU/DciaUYN3XKyK20n5fRgOL/B3yv0WbeGc+E3O84G
 PgQaM05MxommuZnJHNY7vMDxViGLeaRlodynD4l8aQWLxS2WkenmSdh1lAxqf/YqdD3+z7ZJKUY
 Jx1Sk7EXzkAAH7yAM4KRamqcMTv8Kk4QP24xCogDV4QNir3s0pf7HOWx1OTY6CWSKXEdRuvXbeM
 UJDynaYSBzN95WvYVN2IPTv1RX1/+Uk0se2XIl5f+ccys5ozHGtnidVd8hDibOP5RDUGaMKUfZX
 JyP0PsZuG6UwJMkCtRY9ARtK/VB5yj08egC1XUtjFv+KsBMnIMkg
X-Received: by 2002:a05:6000:1ac5:b0:3a0:acfd:d509 with SMTP id
 ffacd0b85a97d-3a0ba10a304mr2351845f8f.59.1746707998619; 
 Thu, 08 May 2025 05:39:58 -0700 (PDT)
X-Received: by 2002:a05:6000:1ac5:b0:3a0:acfd:d509 with SMTP id
 ffacd0b85a97d-3a0ba10a304mr2351828f8f.59.1746707998241; 
 Thu, 08 May 2025 05:39:58 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-115-173.pools.arcor-ip.net.
 [47.64.115.173]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a0b47a8448sm6020402f8f.44.2025.05.08.05.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 05:39:57 -0700 (PDT)
Message-ID: <9ee299bc-f48c-44b6-acf4-7c39ac47e907@redhat.com>
Date: Thu, 8 May 2025 14:39:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Fix dependencies in arm machines and update OpenBSD
 to 7.7
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250508093519.144004-1-thuth@redhat.com>
 <CAFEAcA_T7ebsG2xYbtoLFDmF9g-gQjHW2FiBJ4Coq_4Rvw7srg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CAFEAcA_T7ebsG2xYbtoLFDmF9g-gQjHW2FiBJ4Coq_4Rvw7srg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6ZCAgx9J87VDJaJhqr7kucanQ8c4Qei22j_mioPevuc_1746707999
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.416,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: LRSvXJAeDVee

On 08/05/2025 14.12, Peter Maydell wrote:
> On Thu, 8 May 2025 at 10:35, Thomas Huth <thuth@redhat.com> wrote:
>>
>> At the end of April, OpenBSD 7.7 has been released, so we could update
>> our test VM to that version now. However, I noticed that some arm machines
>> now fail to compile since they fail to include the <epoxy/gl.h> header.
>> This header resides in /usr/X11R6/include instead of /usr/include in
>> OpenBSD, so we have to make sure that the machines are compiled with the
>> right CFLAGS (or don't include the header at all if it is not really
>> necessary). Thus the first patches of this series clean up this first
>> before we can finally switch to OpenBSD 7.7. The last patch then
>> also reverts a hack for OpenBSD in the main meson.build file since the
>> related problem has finally been fixed there.
> 
> It looks like you forgot to cc qemu-devel; would you mind
> reposting so the series gets picked up by patchew etc
> and gets seen by people who only read -devel?

Ooops, sorry, will do! Thanks for noticing it!

  Thomas

