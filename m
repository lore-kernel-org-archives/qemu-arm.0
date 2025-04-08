Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7314225njd;
        Tue, 8 Apr 2025 13:40:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbe5o3phmfLxVMFCmtIBD5975Mvf7GD2elbHYDmz+XE3zyVAZhPnr6AtyP/uAIDp40zzC4moU1ivtYpw==@linaro.org
X-Google-Smtp-Source: AGHT+IF5cIH76PjS4znlsFflbsswSWQ6v/GCU193F/fKKpvA9QE8AhqiwnW9BUR4S3Hw7/WacsjK
X-Received: by 2002:a05:622a:1901:b0:476:77a5:3104 with SMTP id d75a77b69052e-4795f2b16e6mr8067461cf.11.1744144814077;
        Tue, 08 Apr 2025 13:40:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744144814; cv=none;
        d=google.com; s=arc-20240605;
        b=BHoLYz8uTCsxhZAwA4VJOoIku5gB1VyNNUG85RmxSO7M3CI+g9YvICORbKjBHsQGnk
         buEJmBkqLVBsEbo2Oii+eJwjDj13vCk3/0cp6WmZvn4PXhmpj0Oqc8RxM2GuwjcEcvz0
         YmGt6vGifej2eKyeheCQKbB5Wio/jOed3PC1yXXm0XpQBwXfUDkvd9lfRQO9qM49nCFz
         AtsSVKKThvODS1kd/+5EMTjllOfp9dE6zSXZE+0wE32G5xxshBa5QVW3vjQdGgn3pm3H
         uE4NCCpzvtdlnIE7FDzx3loLCG0miNKVkoZTzMoNHkQ6K56a/asMyR9r2FM6X21UkHD2
         +TCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=IgUxJfhh3Ozt/b8ulQyeQIxejkkPVWsfOwlbE8S6q0o=;
        fh=cHsH2ZdBDu2aYv/1qv8vRzTiw+c0GucqB4GPoH36Q8o=;
        b=G8c4Vm597Fk7p4L2aist1be8698MhjjIsJ4GJGmd4+rMxiLJ7DOZh1816qpITrzzbf
         aOM9auCfj0blfTSa/e49qN19yq8h4EhhPwaQi8ks3aIpVxBLToxGMmGR0eHeyVTYDb5e
         F9XAgnW9fimcoiGkhuBB5rE3msjGnK/VVnJ6lj5PXZFZgG+z7mrllmoa+j0Af27Yk6Gl
         dDKvAMR9azZbEl82q4WVOWp6CsQdjf0TWSIW/w8Wcip65aZuxrD0PU2NLdnOAGzWAZxi
         L/fZzxsEVCU4aU/Vwm7q65zmU7ej8FAHrdz6e/AVzjAlZzeXu8YKDVgKmd5gEvV36+v4
         XFHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=VLuZDroM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4791b1c41d0si111404401cf.551.2025.04.08.13.40.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Apr 2025 13:40:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=VLuZDroM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u2FjM-0004lY-2Y; Tue, 08 Apr 2025 16:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1u2Fj7-0004i9-5f; Tue, 08 Apr 2025 16:39:24 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1u2Fiw-0007pD-4L; Tue, 08 Apr 2025 16:39:16 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ac289147833so1004860466b.2; 
 Tue, 08 Apr 2025 13:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744144745; x=1744749545; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IgUxJfhh3Ozt/b8ulQyeQIxejkkPVWsfOwlbE8S6q0o=;
 b=VLuZDroMFPA1sgAG6e3R2kOY4JJbdUpt/PIx8saHkEMTxjLRVM98nUZinLARfyCmL+
 C2fEuibhTLX/449A4Ez/zdRxgX+Ym9PBXSsXtepM8pDkEVBspTVQ6aTnBNckKm+cenpu
 7dGE8MUjPXcDYWT/f1LtdfaOKeGBmXsUS8D93Bfd0mkNO9rS6L0oCa/+C2Se/wUNuvfr
 DIf9ucOje1/1ZG5onl0IP+khZ14TWK1g7n0c2sEEE7tOPlTzr1CT0qaRU/Y45J3knXXk
 o7pDBDNlMZgUH8E9p0PH//xPb4FiHkE3MT3c1ur9dZKCDUkKQNgHXMzFCl9ZMJ1EYfeE
 LwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744144745; x=1744749545;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IgUxJfhh3Ozt/b8ulQyeQIxejkkPVWsfOwlbE8S6q0o=;
 b=LC/5dUXDPnuH803OY7q/JT8pTiDQN+zMoVF0mMsREopKZfwMBWESTvuwCOhZOsPPZk
 XIlQcPFS3Oeyo9u+FMNkBRCkxMr8pxpAAB03l+NJ5j57e7w+fV052r6zCfUCkwOtmX2B
 rQvgKYEdgjuRT6t1E0uLcCbZL7ZqSUFUZqRi4UdY1V5FlSt52PrHC6s8FCWsK4opnwst
 e2qWiLroGSN9rEDOWupvw3T/7tBEYWj/CwwSc9KmrntY7EGyXOh9bgBC9NuIOKeERANQ
 kpOOOxSx1eq5EFP8n5mPxdeF2Grax75k3xUgjOrICLccVvZRMSD1WW64I0E6S+S4QCVR
 5OlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcWUpIInWwaW9cYgm4L2GookkchkSt6s5Y5kNgV/NdwJjNYNT3BULyfJ8G2AUHQ7tXGYB/vO8nGxHtgA==@nongnu.org,
 AJvYcCWlsb5lkIeg5jFC5ZoQDiSxDbl4Ym0enwe6qQckwaraCOU5fYU9lqAUS5oX2tDCIm+O++pRITT/0Q==@nongnu.org
X-Gm-Message-State: AOJu0YzlVRhUoF2D+94EF9RWi2FXO9Crp1Vxx8hZhqH4NIA8c/zABcnb
 T2B0pxox/tBirZmd/z9WZ72I1vCHgDYptA93f1ZfwHmzjFjIDqa4
X-Gm-Gg: ASbGncsgaP2WZJkx5NA7D4X9YZBAgXlyPxGx4g3J/XI3FcPn8+k1EeFAad5LNhLYIuN
 0ogaK/pydJnNJ5QeDY4aSQcvXU+fZfXsG5DqjkVmjmBUEVgPI8+PlYpW3UNHmLpKr/HWLAJLFyN
 WEcrY0dr7oYX3qNVRvcco9DCoB2LJI5FlcmLRMfPWiqU2nRQtEdCIQcg3ziZ8pVmzsMHDHgnBMd
 Cznlrpid+D9ZFjZK4Q4W6rCgwC/wu2bnO7WUt45MflIk5OgCz7I5BiuB6BBh/7/b4//6avBRoyT
 4Ejxj83vhfMjECXr+qTaEhGauSzxj0hCfEDg+DOYBQjDvoeepPeSKCwjK7vl01YGad639u8CW8n
 RW8a4iAtRMk2s9W0eWV+Sclt7EZI3beKQmLSRqrp/yNp/mpDaoW+R
X-Received: by 2002:a17:907:6d11:b0:ac2:b1e2:4b85 with SMTP id
 a640c23a62f3a-aca9d5d255cmr10332566b.3.1744144744931; 
 Tue, 08 Apr 2025 13:39:04 -0700 (PDT)
Received: from ?IPv6:::1?
 (dynamic-2a02-3100-291c-6e00-b87f-49d2-cee7-5562.310.pool.telefonica.de.
 [2a02:3100:291c:6e00:b87f:49d2:cee7:5562])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7bfea16aesm971237566b.70.2025.04.08.13.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 13:39:04 -0700 (PDT)
Date: Tue, 08 Apr 2025 20:39:01 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org, 
 Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH-for-10.0 0/3] More imx8mp-evk improvements
In-Reply-To: <49539ce7-d36e-42f1-9ff2-771c893e5ce3@linaro.org>
References: <20250405214900.7114-1-shentey@gmail.com>
 <49539ce7-d36e-42f1-9ff2-771c893e5ce3@linaro.org>
Message-ID: <36A1B58F-535F-4129-A74C-EE8C467B91BA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: quAq3Bi4PlBC



Am 8=2E April 2025 18:57:45 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <phi=
lmd@linaro=2Eorg>:
>On 5/4/25 23:48, Bernhard Beschow wrote:
>
>> Guenter Roeck (2):
>>    hw/arm/imx8mp-evk: Remove unimplemented cpu-idle-states properties
>>      from devicetree
>>    hw/arm/imx8mp-evk: Remove unimplemented nxp,imx8mp-fspi node from
>>      devicetree
>
>Patches 2 & 3 queued, thanks!

Thanks! This is a real quality of life improvement=2E

Best regards,
Bermhard
