Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp1832121njb;
        Mon, 14 Oct 2024 05:57:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJZbxwjuARV64WI/Suo6StuOE1UUOt7oPkpOv8jVsj523XiT2MZGcVB/1i1D256MmsJ91n2+JDbAH0NA==@linaro.org
X-Google-Smtp-Source: AGHT+IEazbb0jJzNx0A59mJ6WvDOCe/In0Qc0O+KRuxiixvhaykQo8e4FDVPllAkYqZNiGCqPb9D
X-Received: by 2002:a05:6214:2d49:b0:6cc:458:8120 with SMTP id 6a1803df08f44-6cc0458843amr97860966d6.34.1728910620538;
        Mon, 14 Oct 2024 05:57:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728910620; cv=none;
        d=google.com; s=arc-20240605;
        b=Yek/npJowwCopSq0/NHu5j1DwFz36HcBxPqaBTJDpYDwN1KIxvSfut5G8fFbpqR/Cj
         /d+p/ENDDnSd6un0eTXn0yzirJTiv36VAzvjVsCaqFljlWoKviruToIwGHosB1fBu5p3
         7IbS3m2yW2cpHcLBpe7wqK1xFnRNd47Cnu8g2PByPuGEvbtsWIkuhmCXou7SDWn8DHgM
         TQBGk9Z9T6IeEgrHh+r3Hj7KTIWi7bAhz4EDudSYgvtnk6lWYqMdIrSdy5awgJeiSVrE
         M4kYF5bP1wJSYsDVUC92cBktESIQKXVFftLBuai9zXqZudCAj2tsU1SeehKABoLEb4Pv
         7Z7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SGyVz90YTp/X/at9ySIxm4A5Xp03kJO0dRy2Kjf8MPU=;
        fh=oJynAYQ678yo7fx1uB+k4a5h5XCPLTxaZxJk6ad/51g=;
        b=hdpKc3UhSRvfgg4sYTSEClV++4VVxeAbt6yCNIsLfZhrStwMs14GPZARqO1Ne3c0TI
         TUOck2XSftN0QBHcxn2y2c8DFQZRuFjWN6ZG7Whdnd+v3x1jlBK3DeJqW7IrffMIQXwb
         uY3CRCovZHpDRfOZjzjge2DbBTrh5Z5MJnFxOcf1mRg3WJDtJIFnjJP/TJZaxsoYr5z8
         zeEllos/fLt8NO0Bt7g03CU2tEwauazlt5wI9inCk2fJSL50+wsTZ2BDe+ylwlyX/mqp
         l8ypyePwc5z8SLRgybtfe347h6++Y1X7iXQxuFDWfyNzC5QrBjgU6JN6/qb58IOPg/pK
         uS0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VfAoOEhS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cbe8692c71si101857896d6.366.2024.10.14.05.57.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2024 05:57:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VfAoOEhS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t0Kd2-0005q8-TT; Mon, 14 Oct 2024 08:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t0Kd1-0005pJ-8r
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 08:56:51 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t0Kcz-000603-Tq
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 08:56:51 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a991fedbd04so419613166b.3
 for <qemu-arm@nongnu.org>; Mon, 14 Oct 2024 05:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728910608; x=1729515408; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SGyVz90YTp/X/at9ySIxm4A5Xp03kJO0dRy2Kjf8MPU=;
 b=VfAoOEhSkh4l/BXwB2aAFqZDElUJoPdx3/YciFp/kch7fkWpsvk/mR8oKcrRnvJrDA
 bArcL8Px91YH3MP+lKDE+JL2RsrP9+MfgQX3ttS0fJBl4XF55SElj7pol3i9jETkBjbV
 WmXTDUUSvWCW/3DuuwRZ3OdnCO/q8YSj6NGkZEwIy/wthGYfxafDHMKmysPw/U7w7JJn
 GUZ7tkd0C+imuaW1afQW5kJmp1fIGDyrLfYtVz8pIVUNUKEN2/kUpPv3bd4T+ZQVDF91
 F5APNTLmVJbQDqPhocKJPxxxhykLwyQ6y+GUBrX4AGSUh7J452eCr7xJYBVBNaunP32z
 i2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728910608; x=1729515408;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SGyVz90YTp/X/at9ySIxm4A5Xp03kJO0dRy2Kjf8MPU=;
 b=HkcuVmph5t+2wnfx/EX+rPSEGetbGP4Yjce27lvgHPwII1a0Of32nWILgdlhbIf9Sv
 WqWvt0wI/a4OqQAJAGnvkv6VJw1kf4xdUT+whvexxW5nO5gegTtdOI2tBnpBkQBqW5cf
 hSCyBR6cPzUM2UKqQAagcrnSKOGu+SfHF01xkHwSrrQ5Wq7z0E/qCsBjMIixZ4TNONzg
 ePc5WY4y9UAKTLtvgLPNmm+L+Hz1p07Zv2ypltaWSzKrt911xf51wmcbA7p9wRthWA6g
 XtxmbCunuYP6B0Z7nhTEkjT4L3MC0sTxR6KdRIxeiYrD/LKBgGUwxpiXNoNHW8x4N9/3
 B5Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv9wYuDtqayo0RsksyFB7QO9EN2GfD52N7C0MoZEorUiCCMwLRwvtb3DeTvesRRhV1USCopBUQQw==@nongnu.org
X-Gm-Message-State: AOJu0YzOVfzJmTVYxL6p7NXOPpO2y6z9I1dtpCz+ihzFI6aIkWC9Dgjq
 UNkNTfQhnP+Iy5TVeCtrMfxBe6DvZHwEDlW3iq6uI+7Hd9CGdYWggdbrUKFMvfB54KU6GWrUZeO
 zWJf9dqomDtXiUkpSIr+btweQQliGYIPwL3w4sMJBxNJhNvZl
X-Received: by 2002:a05:6402:c41:b0:5c5:b7fd:170a with SMTP id
 4fb4d7f45d1cf-5c95ac50794mr12520175a12.28.1728910608234; Mon, 14 Oct 2024
 05:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20241005205748.29203-1-shentey@gmail.com>
 <20241005205748.29203-4-shentey@gmail.com>
In-Reply-To: <20241005205748.29203-4-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Oct 2024 13:56:37 +0100
Message-ID: <CAFEAcA_w=USBp-hbV+DxuzF_zfvCFUoPFoAZorD55R6VN92kvg@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/net/lan9118_phy: Reuse MII constants
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
X-TUID: 0wpX4e6G3+7i

On Sat, 5 Oct 2024 at 21:58, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Prefer named constants over magic values for better readability.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
