Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp4098283njn;
        Thu, 16 Jan 2025 15:39:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWM/tibzLjku2cwJuEmXt5nZPbcwn4xDFec9BEAsmYnnIbm1ppE8kp/4AkbPcksU2qKhNiQ9kQkSTJLwg==@linaro.org
X-Google-Smtp-Source: AGHT+IF6QEYJXdjxnodZX7Gf6TpkFgZ15BNmCtCYQOU0engesEBb3Pomxqmb3Q6zqbycQzzDsbAH
X-Received: by 2002:a05:6214:4401:b0:6e1:a5c1:d52d with SMTP id 6a1803df08f44-6e1b21c46bdmr14523466d6.31.1737070791789;
        Thu, 16 Jan 2025 15:39:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737070791; cv=none;
        d=google.com; s=arc-20240605;
        b=Xpxjvy2sHjpgrpSmF7v6ZkhxHo7yEXMhloUlNjT/H2eDb3KpxF/8xoR24rSFh68FX9
         ivKnWhLx4LRVjDRpzK9/59dYAtzkv6SutSqTv/OQF0ktFmzZSS8JKibrOM0C356/VvHy
         ckWrdrbr8G4CjvKkbsVnnu/qEc6JcdipFSxg8LQURS8GDYbnv4DvJk9k3P6wcvFvDYBo
         7HeGQrxocpBK4s89j80Ks2/CiEk3tVcMpXwvktX1O8NuTTUh7mHD3c59jqRTOQCgJENw
         XqVKq3nJ95UXQLiLAEf3ojJ1Zoj30eODF7JWXa9CVpuYC+wjpQexeVRB0J6cYytX90RI
         jp8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=WPddaBlTnCpqPRcq2UIs71qmpQumLiZWMEWObSxaXvU=;
        fh=W/YVSO97bhR8ktVMFk/9BHa4j65xhgN1Jzz+fsJK2V4=;
        b=H655cqk4VwYpEKCRnhVNXdkEhRZa5Qtpeq/qvfMaC7hrcMvzuWQErBi6osOGiVQWkV
         mTSDV1LZcXM3HZeyhrk5ttXjgeWK2LZYidiR4qwNdwLKZnFHk/gmUe7NLob6yeThtx2s
         rRD7lKeJiiJ3tpVUzulCiFZJkVPCa8AvksQ++1aUQM0BWRvxlxQGSjiqHuOYdmKBoynh
         DTfuq9xoJfFefNqnp2Jy3U/rNSDN+b3xkxWIZXzZSj4vfbUE9SYrWnhjwmULTNWulsH9
         cKUHeZhppK7pqIU92WVQmEYBwHwjZ/W3gY/vdMcjOoxiQHfmeiVtMIOCNZpar1XoPIXV
         fyDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=e3hK4O86;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afbfafd0si11522086d6.22.2025.01.16.15.39.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 15:39:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=e3hK4O86;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYZSL-0003qX-Ql; Thu, 16 Jan 2025 18:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tYZSE-0003pJ-DY; Thu, 16 Jan 2025 18:39:14 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tYZS9-0001EH-FP; Thu, 16 Jan 2025 18:39:11 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5da12190e75so3040630a12.1; 
 Thu, 16 Jan 2025 15:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737070745; x=1737675545; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WPddaBlTnCpqPRcq2UIs71qmpQumLiZWMEWObSxaXvU=;
 b=e3hK4O86cJ85Kzlw0Qp6DBdc3L+ayaOe5hjQWJ71TcRAmhJpZ7JW/vRSUNjKSNt2cu
 mK7YbojmpxtKy6MMu1cRIl+j4s4rzqkBhz0zxouyZrosLXGbFNQ9kjM0093Wj+Xa/dSo
 WtahcB+zoLJ+5hfxYeAJMQkeOJPOP6j7dvd9rMVTQGskkqvJeH82S4DItjtLhaMhtLh2
 sZdriaEpq+3fhURvWv9diQ2V8Beciu1lOz6XxsZfiXaDIt8IupGXbgWq4FSb+6503khK
 z29ZNUQ2el9uV7tAsZ+0h4n8fdhnZzlWWd5BeRaBrQd6QhvSf7c4KKTDI+TUso64Qv86
 WvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737070745; x=1737675545;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WPddaBlTnCpqPRcq2UIs71qmpQumLiZWMEWObSxaXvU=;
 b=bSbw5Zup+IelMJIuHGcyyJxHtZnLGR88qH+/beXyRMiUio9WjyiNxDkahx0chVsgMy
 Mttequthfqs6PGtyxqRVGxKH+4gnOZaiblQj9G9gCTyYGKieM99dri2oQIMfxWNhpINv
 64McDtobDNkOX6acTwLrG7vpMWorcMG6R2YLKACLVYGV353yxq96tZKnjrnbA2eA0QIA
 rnkV7J/IM1WdvU0PySq16JqK5QZ+ijKvGUeTY1GFswrLrJQooH/sdR7/6y1b9TLAIYTY
 zfuAsfHNudaUCh0VmsYn4UpaX0tK8yuKHgoSpUevkWSkBJGjOSlsgIBfij8ICVQ4E1uu
 loyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRYkZpWe/bBrvTHGIj5K6oRXBhMTWObyg+vTGcZBQMYZLW7CZvg8btvTdQAQqK8gOvtazLLBOzOejKWeI=@nongnu.org,
 AJvYcCXDML7jsshst8ujSvnssBbAYOqTegqzzq6O8GuAz4QVdJWYYKwxOVP3kA/ppy5w8uVLnZA7efk16a9GoQ==@nongnu.org,
 AJvYcCXmSmjqrxdjxEaU7u0CIAmhZH0cuWXx3hWdp3jd2rE3xcUyk7a0cLWFPmLW3DGBPRLcvCZ/SchS2Q==@nongnu.org,
 AJvYcCXxANmk+wDuHgyW5igsQNOEWO2TW87JyQrU69tzH6CsXbZeQ8o4PFUoVl5jJjyrWJ3zwvqLVMPHvMIkQg==@nongnu.org
X-Gm-Message-State: AOJu0Ywrk/5OkOaVA7dTCHShEVtmXN1DhMPsoxaZC5+UBo8DJowMqhPv
 ReaKxQBk86WcgOxKpdZrypZBAbc2U9rG9tPta8BMT9FlXqorEHpA
X-Gm-Gg: ASbGncs0i7tXDC8xr+KgVkf0G6jV+qIxaMF5an8k+Vrrhce8EaFGUTtRO2Qsi+oYWgj
 QgLkdQfc2l8bGTvKxjxloEzp/ZrNmGeSGL+vBvVp74Q0PoLkAz+gMXacDLRNBr+/krnfKgzsNYD
 Wx4681T3Lnbmb85ThWoSP2MohFlKBtLI3MW2P3TlqY/tZe4PgqbaEA/MuVpeT8tsy7tmwKjhoaG
 zGLWnMfEDCe13neZ9gm8QqYaOvg9uid5a/SvlffrZ0Ac20/Qn6dH/8SMmUVbtHPM8oDeICi6Ll9
 pOWcDbxVzM3Ev32Nc+7V+hXGACg=
X-Received: by 2002:a17:907:9805:b0:aab:c6a5:7c71 with SMTP id
 a640c23a62f3a-ab38b232faamr42776466b.14.1737070744747; 
 Thu, 16 Jan 2025 15:39:04 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-055-006-027.78.55.pool.telefonica.de.
 [78.55.6.27]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384ce0c99sm68816166b.41.2025.01.16.15.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 15:39:04 -0800 (PST)
Date: Thu, 16 Jan 2025 23:39:03 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
CC: Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Laurent Vivier <lvivier@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-block@nongnu.org, qemu-stable <qemu-stable@nongnu.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_01/13=5D_hw/sd/sdhci=3A_S?=
 =?US-ASCII?Q?et_SDHC=5FNIS=5FDMA_bit_when_appropriate?=
In-Reply-To: <823b6f0c-7e2f-4cc2-bf5f-79f34c77d7f6@tls.msk.ru>
References: <20250111183711.2338-1-shentey@gmail.com>
 <20250111183711.2338-2-shentey@gmail.com>
 <823b6f0c-7e2f-4cc2-bf5f-79f34c77d7f6@tls.msk.ru>
Message-ID: <B999663C-B1F1-4A26-AF25-BAA23B8AFBA3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: pKlwfCt+jEDd



Am 15=2E Januar 2025 12:55:29 UTC schrieb Michael Tokarev <mjt@tls=2Emsk=
=2Eru>:
>11=2E01=2E2025 21:36, Bernhard Beschow wrote:
>> In U-Boot, the fsl_esdhc[_imx] driver waits for both "transmit complete=
d" and
>> "DMA" bits in esdhc_send_cmd_common() by means of DATA_COMPLETE constan=
t=2E QEMU
>> currently misses to set the DMA bit which causes the driver to loop for=
ever=2E Fix
>> that by setting the DMA bit if enabled when doing DMA block transfers=
=2E
>>=20
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>
>Is this a qemu-stable material?

Good question=2E Given that this part of the code has some further issues =
[1] I'd rather not alter stable behavior because we might just trade one bu=
g for another=2E

Best regards,
Bernhard

[1] <https://lore=2Ekernel=2Eorg/qemu-devel/4b846383-83bf-4252-a172-95604f=
2f585b@linaro=2Eorg/>


>
>Thanks,
>
>/mjt
