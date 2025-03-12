Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp308161njc;
        Wed, 12 Mar 2025 07:40:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSD1QApts8LAukF9XUl1Zy5DZ/uw0NObQNSqeolfneXTCpf3bZ0U3O/v7a/zKyVC93zoqLIlwCu/++rg==@linaro.org
X-Google-Smtp-Source: AGHT+IGn2CiPBCjOD/l/OYvOLMsBrYcTCvM/ga1aTe/G2R4h1j1SOdKQe67bDaTtwUFINRRQUQdr
X-Received: by 2002:a05:622a:199e:b0:476:86bc:8b41 with SMTP id d75a77b69052e-47686bc8e7emr192248131cf.52.1741790429448;
        Wed, 12 Mar 2025 07:40:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741790429; cv=none;
        d=google.com; s=arc-20240605;
        b=U6u9P1ljHfbZ3N8p5IG0Q9+ZM7XVNyYgj8hKpem6V6hPrx7xbguMJG9uzBpH3gS0p7
         cT1y9b+nSWfCR0LczWH80SE7W3tldj0fQaKtp4A6fGsrM1NJWmQQ+GB4T2DxSnfkoIQL
         5pE1DIen866C87+BNlWfvjFCRVfZ6AsXdXagUWAABbLYj98L+YOK1aBvjK+K5iCdc0Zi
         0vpChVHAjrMR8kE4LB9fh0r2bWc2HB7r8dNr1zVI6Agnr08bSRgcgxfXJe5VN/OXL8sv
         ZR95z8N5pG6oEO1TtpDrWSdUj4d3CLoEZ9exlhk9Kzpc17x9Dvpl26yvUYj7ElGc5a5x
         FGzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lKLwDSRu++rXmRzCi9GDp+l5O7Md9kfsrLRYsLZZSZg=;
        fh=RXqt1Ihe6QRP+OJ3Eaub5K3fTqn4NvJP2tCwF5bSb7I=;
        b=Qk/SbRrExkXjvKQT+jK8RjQ3AD2VrDSNAHUdgpv1X0cJEGbEXVpajY1+ouHqLKF1Og
         ZJ2kd8m/e0ExbxkDTaTVrIyuOiVQh9CU6rAvMNhZYEeztOd3FOt+olAfKJ3qAuIM7hOA
         OxWedSeRmvVV7t6zPJ6oyNNVs3KYTJocb+/hmGe7PL0cdAlbxd7xE+Mp2nledT9uBqZk
         lnABHoYj8mPH6KdLlXIk651nN+//offZIOqM3yeg4WS7iJEpHcrVvCDXU26hd3a2lTXr
         yK1EZz+AMY0NaW7mNZf4ZEbIC5Tp93vxL4e2lBx/kOs2aYM1AA61F/sDUDXeQT/ZYSX5
         BGFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O4fHTS/L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4767da3e07csi74806951cf.340.2025.03.12.07.40.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 07:40:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O4fHTS/L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsNFW-0002cn-Oi; Wed, 12 Mar 2025 10:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tsNFL-0002c1-Rd
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 10:39:49 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tsNFJ-0004Yq-Sm
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 10:39:47 -0400
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e6343c68b8fso4857699276.2
 for <qemu-arm@nongnu.org>; Wed, 12 Mar 2025 07:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741790384; x=1742395184; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lKLwDSRu++rXmRzCi9GDp+l5O7Md9kfsrLRYsLZZSZg=;
 b=O4fHTS/LEQT3sCXAa7EltR3jzlmrscraWHwK3SbnqprlU2NzWtYcx2WXBhaqUVD0n/
 oj6UujspSyXGd9bugwqE9tmkEE0I5LAq5LiAXZ5QZtu8K2OBK+Msi6A0VuL7TxlWTzCz
 /SO4kYiAxg6A9tv2nCt8PhbF6oByOD+NQ5xCw2N8JaJbR7ZlHHfa49aEkIiX8PWOtg85
 ODxNeacWROdisLagT0NWOCHo2gfuPbiK2gqQES9iX7BrwEFDiEPAde7lapyhfa5OY16J
 vtjxRhSRTxwRLm6EF7k9rzp0IQAXBTB3MtQMjo7TUKMR9zezWtDGsps0JOEF2ZeNdAF1
 lQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741790384; x=1742395184;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lKLwDSRu++rXmRzCi9GDp+l5O7Md9kfsrLRYsLZZSZg=;
 b=R0oWi9rcnGPybPC194LB/vBlfYTwLxaspW4MN6g+S6y7vmqZ0UDTotBmGunvb4OGNh
 p36+sKUCZkKGuSWEL5DQ9fFbIZStp3qCw0HKXLSIS+P13Yoi5moFhsOG1K4+XTgWiong
 svWBvZdYbAQtflG9KgzP+VpZspK5gGLKM0M0FV5eti8qkUQvBjTzHi/5acpH01B1bfue
 a+CRcp72Fpf+RXksKFP4xV2/3Q4N0BUYryHBUNfQqVWFqihVKBQfaPHRVk9FOdIUdYDQ
 TDDZCrTQwuWrHF9gTx2zZbQLhYgLhEfI0OqJo/DFik7vg5gFtCuTgXQnMQZvAb2XN+zD
 AIvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkUctfH1jGeBSiLdFp51hI/Q1UPBqv21VYQItUinNa/TN32ACgAEByIWvFgh31Z+b8wyMtpROBAw==@nongnu.org
X-Gm-Message-State: AOJu0Yw4HpGIJY5ap/9dKrHfuQkxcpbKe7SELiQEFYZ+8WFKEfOi+nHS
 VZEbMFv6LUXQZAP5GFxy4/Wy9wCadGHkzdPpVkC16oB2W6pSGPGUgGwb2buKpXGKKfyELXj8cZi
 diHhwBXovJ8GI4t7bv0Wmqy3u9jWxTAIqqlsfRw==
X-Gm-Gg: ASbGncvj36pW4v4SqZt7b7EB0m+qHgBBiZnVrw2MgSw2KptT1/3QRybsVYUllQolvPR
 gLG7ZjGD/vX7YmfSy0VdijiVhIVvi474vtTOe0wh6I+rHkwiHE2Gdp7UrkvZvr8w73CbyPRs62z
 oawRkA6Wqs4xaDnleyu9J4flnnRQM=
X-Received: by 2002:a05:6902:2101:b0:e5e:1062:bcfa with SMTP id
 3f1490d57ef6-e635bf12a3bmr26433005276.0.1741790383959; Wed, 12 Mar 2025
 07:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250307190415.982049-1-richard.henderson@linaro.org>
In-Reply-To: <20250307190415.982049-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Mar 2025 14:39:32 +0000
X-Gm-Features: AQ5f1Jp3S8FDkzyB7srqm6D25baWi6BKSGaG_XGbX0-baRHpvzYdL_yoNrNPxH4
Message-ID: <CAFEAcA8UeQLKrUSF8CpORFRzWSKsBMqa_vbNwCdsF5Nk6up5GA@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: SME vs FP enable fixes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
X-TUID: DkpO8EiDNVQk

On Fri, 7 Mar 2025 at 19:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> If SME Streaming Mode is enabled, but FP is disabled, we get two
> assertion failures within the translator.  Beyond the assertions,
> this combination should succeed because we're executing on the
> SME co-processor's registers, not the core cpu's AdvSIMD registers.

Patch 2 has a 'bool ret' declaration that needs to move to
the top of its block. Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

and applied to target-arm.next with that minor tweak.

thanks
-- PMM
