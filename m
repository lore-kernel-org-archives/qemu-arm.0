Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp152875njg;
        Tue, 17 Sep 2024 06:01:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWT21rQk+UV1NM7QinjLxFn6VOcCsbnIP55zvIIE7g/XBEqaKTs97vxFn/aa3YBeeDWL2uFJxqexFXtmw==@linaro.org
X-Google-Smtp-Source: AGHT+IGlUehKy6lQgQRySk2jBzfCOj3CyRMjWlCXDMcfn1nAdmwce3KVQrV3VUC1rNGMLNzlrlLp
X-Received: by 2002:a05:6122:3291:b0:4f5:261a:bdc4 with SMTP id 71dfb90a1353d-5032d397a51mr12946885e0c.2.1726578088713;
        Tue, 17 Sep 2024 06:01:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726578088; cv=none;
        d=google.com; s=arc-20240605;
        b=C4CrPqxAaEfzEFG8QKEUHbMy/O9pGQdhmR8e2QhVkD5RvAgd4wIbstQvO1Oh1/isdv
         iiIQa8ytai1JLrZfcafj12jNRBSfkGt6M7eUyQRYUu9xondw2rNppyiUs1dVutoFlndE
         yjOoVp9kSD05bnWdRDrE2JdmUYCBK9ioMb3CqzaCsB86ZxJEKjqhMr+AzDsEFkaoREfn
         RW2sgwRrIY/XCsgngKbXz3OxJadDwyuAsLgCd8QSFlCH2EvtvYS7WFSBgZy4ybfOn3K8
         NDBELTnAnfTLDzvXRtHLMDDS4jRDly0G3ydPXjeZtylwzYT2Akef8eQe6iaJAQm87A6U
         xsig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zuLdNxOOuE1/68l3MCMFs4AY+pYagPyWswEZDL/NiJc=;
        fh=qiZPS4UC8WZTyfFCFo+5R+0C+WhFaVgWm6qQmIOAEaI=;
        b=G1bE/CvVnRv1o4JqOIvEePqaDJYxG0pWHeFyzYH2iA1hQz42fu4Mty270drJuq6ph3
         SEiWUfU/HC/VzERkd9M1QYfPUQ3hw3HybI3WzKgNoCsVxjdAWQbXpQ13UeYv+VXu0Qvn
         p5ij4GBSFgwZ7yED3+DayKPXfxlBJJJiQYLEZDTH0LwR4TYTBAGsKpaefvMyA7BWlvOR
         iUVWOy/nCA6KHQG6mIIfYkI0mG7A4RcXR2pwFKb9C+z8zxjtVJf0pVtINszKyHF4JRFL
         bzvwAZI0qcXuxBM6+o2bvV+mPRFJwXbX5hCtTntE0M7pwOLKdKv8HqNnZK/xPcKqgXR9
         nQnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s1CA3V0I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-49e6b0fcb69si1219292137.62.2024.09.17.06.01.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2024 06:01:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s1CA3V0I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sqXpS-0001s8-Rf; Tue, 17 Sep 2024 09:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sqXpL-0001in-Fy
 for qemu-arm@nongnu.org; Tue, 17 Sep 2024 09:01:08 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sqXpI-0004vc-Gm
 for qemu-arm@nongnu.org; Tue, 17 Sep 2024 09:01:06 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53660856a21so3872764e87.2
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2024 06:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726578062; x=1727182862; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zuLdNxOOuE1/68l3MCMFs4AY+pYagPyWswEZDL/NiJc=;
 b=s1CA3V0I0KiGepdxoFIFg87mnTW491l8vCC1X4FlAoOkYQiinUdoqlh7Uj9FCuXYsy
 C9JoxpLRngp3fawZhX4Ccek5goUxXoIzl0yNHBJjkF7HNS1qib4MyJTVHat7k5/97fa3
 eImkF05g9jYUVP/T2X95FqkCCU00+X5uVVkQm+fTrYsaRbHCrhDgtEGuCU8Cal8wiFXf
 5118bhBskfNBY7j/S3y9FM+sKNqvjgf9hvRjHnbdxWkc+ejKNjWt/KEKadp+3ByLb7yB
 iVgrvs/RrW1hOhXfaZF1igRN2x1jNfkHkd3rzGZpPGc/WEv/nFluulpjy9llOHT9WKR6
 Kw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726578062; x=1727182862;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zuLdNxOOuE1/68l3MCMFs4AY+pYagPyWswEZDL/NiJc=;
 b=JuzRCm15ervlbBO8nxKifPSH7q5yz6ZUSgCQiMQ20ItGtgunCACOjByJNubtaHZd6z
 fiOuymRE1E+C0SevSvtPmC124Hu3P+QOtr+768f3OiFfnaHNuvE2mPE2+xaWHXL/oqbO
 HR1wzHvi/bH+jA4B6iGaGICbBpq7+OthPk8Mng2ycjzh4gbxM7rIzzo+0gGbrH+F6jKL
 tmivlkIh8lDKgRMwxUGUrM2rE+6/wGox74U11ioBn+2hK0G8tR1E4oPfwRU2Zk3KGwKj
 fhfobROiFreujdXTR53OjsxE7KrQy71ifTFjRwoPQpc7MO+w2eIEc8+bEAPk6yvhx77f
 w4ww==
X-Gm-Message-State: AOJu0Yyl7e8u7TBk+BMsYsw4blCTtlTl+mZVJuz7MhWfehJyz6/Lq/tj
 xXy1mFOy6ClijHVO6l7JdWfU/Dz5umSDy6SvcRoHOac+5sTM+vd+eNVaOx8MDbXdvjMluM7MbU7
 QXCk4zhyzMN6q/5gcE6m2GnWEDy42X/HL0C8t9A==
X-Received: by 2002:a05:6512:3e09:b0:533:d3e:16f5 with SMTP id
 2adb3069b0e04-5367ff24fa3mr8984525e87.38.1726578061021; Tue, 17 Sep 2024
 06:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240916185708.574546-1-clg@redhat.com>
In-Reply-To: <20240916185708.574546-1-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Sep 2024 14:00:49 +0100
Message-ID: <CAFEAcA_mxQsC-vehCEqxY+2+vFeq5saWhhRg4EeqrP6Sh1xF0A@mail.gmail.com>
Subject: Re: [PULL 00/12] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: KbaWM30Hny5W

On Mon, 16 Sept 2024 at 19:58, C=C3=A9dric Le Goater <clg@redhat.com> wrote=
:
>
> The following changes since commit ea9cdbcf3a0b8d5497cddf87990f1b39d8f3bb=
0a:
>
>   Merge tag 'hw-misc-20240913' of https://github.com/philmd/qemu into sta=
ging (2024-09-15 18:27:40 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20240916
>
> for you to fetch changes up to a93bb519e683fd8f8d7945e5517fd5ad74cc41c0:
>
>   machine_aspeed.py: Update to test I2C for AST2700 (2024-09-16 17:44:08 =
+0200)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * I2C support for AST2700
> * Coverity fixes


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.2
for any user-visible changes.

-- PMM
