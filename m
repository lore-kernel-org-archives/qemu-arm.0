Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp971693njm;
        Wed, 5 Mar 2025 09:41:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCULeZUapGllFysQZTVxdlDw0aavCphDH55cyT15c/KcQ9x5XSRoAhOxn1XQNZJXr73t/sZfbEFi5pf1fw==@linaro.org
X-Google-Smtp-Source: AGHT+IGXNFwvRRSR3NktpLYPqn2uoW19mDNch+I6RgNqoz9Fvbw9lJhm1ngbAfhG0vC0E+s10BMy
X-Received: by 2002:ac8:7d03:0:b0:472:1d98:c6df with SMTP id d75a77b69052e-4750b4d8a94mr48742191cf.52.1741196510932;
        Wed, 05 Mar 2025 09:41:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741196510; cv=none;
        d=google.com; s=arc-20240605;
        b=Dh8qnolsp0nSeRp/hT7He8Md0utDVCTEYA+rCSZmYNubvOk+IVZ1Q9QFcJMY0e/EMw
         a8SdVEMkDf8e+uYshpQUTd4JA6vSCsrTdWyrLOPsnnPVLhyQpInFQEQDARB4BLRjXP2n
         odKQMXiVrCo/PtEtjoV0FQx2gJHolVF+aBMXgViIgKkPfzfS+wlktxLqSkV7Z1SnmjRk
         KWXajw5WpleuJEeASx/72r1KBPtjVP+Y6oMaW6jv/C0fsI4Q1W3Zrp+DMn5H1cyLHMJX
         eNnJTUUTbjGYg/B0xHxs9G58jvV4zqJ6yQsdUUNCNosFSVh/lIunABWIIZcaAPhfSsBk
         n/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=ug9sWooub/wU2I4q0ArR12oe3roUk635hFiY6W9/ZYs=;
        fh=+itTyE1JByMtx9W2wnutebXu+xbEgJ3bOOxqRAj2G64=;
        b=I0Jrk+VA+2Py6CpcvxkDmkV1CHjiD1y7RIlQXaKn5sAn3T1j4c4m45/jacn+1MHBMg
         ZByHjJMbfowY1+AeONvrhKcRNrgD1XGdPJejto21Dxg6zKmCh8laZJtYxDFugE02ShEn
         nW8nAHAEVimoG3fW6B71Zcc3lPAC7TTgPqYJWgIPIW2eWvybiGparlBBbnFZtstg52jr
         DY1s6NSYObHZIw+QOJlAdh1p5jCHuuESI22FpiqHA5MbWAUQRgWhmDDxE0SMTXxAPL60
         PynYZvsnJZBMtRWaZOXfTt/5AibIF9cx7jAlXOYznpDRMAHzyhJYtJNlFEBfgkgJKdN+
         R07g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O2tQrQNr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474db70a663si70963861cf.422.2025.03.05.09.41.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Mar 2025 09:41:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O2tQrQNr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpskb-0002Xh-2W; Wed, 05 Mar 2025 12:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tpskZ-0002SR-H4
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 12:41:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tpskU-0007co-8e
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 12:41:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741196497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ug9sWooub/wU2I4q0ArR12oe3roUk635hFiY6W9/ZYs=;
 b=O2tQrQNrsUjh1iPuV8cxRtO9ga3xs6Ug4xtX3VOHEgLCShkOPwf5eUVT19ebdMbQ5kDXyj
 3/O4uKclZavXOQPamxNMqCmqFgq1yvjVIyjUEG+rfFL1+vGHfbqy+It8RcJ1cXJj3BLkg6
 OOqwtw8bwPeEa/PzyZD/LuzHtpTVClg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-eTgF3aLjPDyvUTYhq7LyrQ-1; Wed, 05 Mar 2025 12:41:35 -0500
X-MC-Unique: eTgF3aLjPDyvUTYhq7LyrQ-1
X-Mimecast-MFC-AGG-ID: eTgF3aLjPDyvUTYhq7LyrQ_1741196494
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43bcb061704so10783595e9.0
 for <qemu-arm@nongnu.org>; Wed, 05 Mar 2025 09:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741196494; x=1741801294;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ug9sWooub/wU2I4q0ArR12oe3roUk635hFiY6W9/ZYs=;
 b=afMAZt0jnEynlshHTKpm5BotDG5uf7vRTAaXAalghqC1fPFg46uXq87K1bEepM5qvt
 bjIsveYp7ADoMSxJdvxxs/BB+yie52p6E/YfYN3/5vQOUtOTgitLj7+1vzC+CYdzOmLT
 Yv4d32RDmk2gkKSYM+mx1m2sfoTOS8dtkFboR1RWHYgJ+AV2ofwhXtl2miGqCL8CFceJ
 WeZmrNk6WMDCBKEv975R4fmsvndOup6u3fDwDlUMd64lqn37tzCdFwIDWtUzkfakr2x4
 GoA2sVlHud911ymMgVC9SNUX24fifj+KHmWaQejvWpcHrcqvWdzxKltt/KuC8oSHLqsi
 w1GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuezBilAJ7ahChkD4GuGWuqGyKLIYGNa+OU8gYnfX3f79TV/Vr9juVKerlvO6fWlZmAk3LkENQHA==@nongnu.org
X-Gm-Message-State: AOJu0YzS6Y/oiQV0v/M6zhj+j4yTw/+26b57ptYySWLaQfgN7tHYZG6f
 ZS+hUI8oyUe49sz5kzo3B1ifvflVl/0+R0YhwvWZqWVTFMZgKUdl/IKk0fNRopFwOuHBgqN63tJ
 SMyHQi/sM06MQ/wtsu15y86r+y1qz2HH04lDpEMf73F6VNpFsTQ==
X-Gm-Gg: ASbGncu888YTH5F9Xq2s0tlCgRgWAUS/vTE71FSUVwR9JcOvMSCi2AnW0nmlFq+OCRj
 1YHzjMDneuPNqh3p+PIqg3QBIJegBFsQckEZ7GnUXDBuWbfvAFX1BzIUrQcp4YKJYrN3DwVwF7Y
 QEPkVO6zLdI1Zg0VGFx5rV9Imktyu6BcQ/mi8wAM0pBkLKOvARIXKvjimjKwN50FH5Ekr6CuBIS
 SoFjeWt9Q3VBMfOFFHZJm1Rp7+30O+QvnqZpJNf2Nvl8HDsaLriu1JklIm+skCcmrYClWKIUfYx
 XClFeCmj9IjtXfbjC/vsG6N7tWhSGatrvKU1wHLamioQ4sqkxXqdqg==
X-Received: by 2002:a05:600c:4447:b0:43b:c0fa:f9e4 with SMTP id
 5b1f17b1804b1-43bd29589fcmr30266515e9.13.1741196494067; 
 Wed, 05 Mar 2025 09:41:34 -0800 (PST)
X-Received: by 2002:a05:600c:4447:b0:43b:c0fa:f9e4 with SMTP id
 5b1f17b1804b1-43bd29589fcmr30266315e9.13.1741196493731; 
 Wed, 05 Mar 2025 09:41:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd426ca07sm24746285e9.2.2025.03.05.09.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 09:41:33 -0800 (PST)
Message-ID: <689f9d0d-bcf9-418a-bd5d-6600503acbc2@redhat.com>
Date: Wed, 5 Mar 2025 18:41:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] vfio-platform: Deprecate all forms of vfio-platform
 devices
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.williamson@redhat.com,
 peter.maydell@linaro.org, philmd@linaro.org
Cc: zhenzhong.duan@intel.com, will@kernel.org, maz@kernel.org
References: <20250305124225.952791-1-eric.auger@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20250305124225.952791-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YTQhKbZj364EwChBFbz4XQS6FRRf9Ou0QjHvbU0jkdg_1741196494
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: BTG+TjS71RUU

On 3/5/25 13:42, Eric Auger wrote:
> As an outcome of KVM forum 2024 "vfio-platform: live and let die?"
> talk, let's deprecate vfio-platform devices.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Cédric Le Goater <clg@redhat.com>


Applied to vfio-next.

Thanks,

C.


