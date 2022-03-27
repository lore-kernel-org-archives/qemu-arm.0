Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp5532546lfb;
        Sun, 27 Mar 2022 02:38:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/+EaSDlXtpQv2izeNypCYgvoz675jctLnBlp+bkHXhVA4vFZ2LX7JsRk2Jg6NOBYwUdjo
X-Received: by 2002:a05:620a:1102:b0:680:ae2f:3deb with SMTP id o2-20020a05620a110200b00680ae2f3debmr9100919qkk.79.1648373882773;
        Sun, 27 Mar 2022 02:38:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648373882; cv=none;
        d=google.com; s=arc-20160816;
        b=aD41TvVmcKFjNaJn8cIzCmbUXqE2iTZBfr66EECoBzXZZnY9C99F6izA4o2i+FedO7
         shy4KBJ1/H4IUte8AytRZ3k89dnk6QRHA4Jr/yXQXqvf8p97vKvv0uADUuovoZmUTOEA
         FWLTpkVNI2ZVVeXKxI3EscjXla9dmvQ/E/rxSPo3/px8KTWcu6JbLLAlgunPT/PIbH2c
         AOMerdwWoLCUHLkiftTu2m9i6QvIzkEF4/1O7661TleB239/JZH0veNuXHei0ARZccwF
         IK6xfAj9HFL6PgjgYQW2g1+29R2o57FyU39rnfCipK47eQhSoAuhKNE0YbG611HiqUQL
         p8EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=TPa9Ien78uey/dBdpHJRkRyfhRQedcdj+KNczv+NRpI=;
        b=YQlmaV8n0Izwu48BXosidOlWYwvvec8W4ekgu/qOzjk4asFBm8joCTxiT6+8HQkVtJ
         xPB9E5HN/UTOk5BkX+LCHGhmuvhHbpMcwp/vGBWmGJ6foSbFeqnAoyeV5Bngiub2EK1H
         sMWnteN7OcNNUH+oal/bLWX2qaxuU1R1tRhCn3tYMnkRfz6Rae0cmG73Ri3LaLWp0WY2
         U0CW0gftvncPyZeRGawo/OXYdBisodR8i54R5vqGjeoNX8SmsvRClJhlNLnjh6dVBcmP
         YDSHfoPd8hUvbrQw6q7ls0Vk5Uz4aDtX0ITjuU6CaDD97kzm4t1rHzXqUi76HI6Z0M+B
         +Bnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=X8ZmBIbl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020ac8776c000000b002e1fbf3c0ebsi4017017qtu.732.2022.03.27.02.38.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Mar 2022 02:38:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=X8ZmBIbl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nYPLW-00066R-A8
	for alex.bennee@linaro.org; Sun, 27 Mar 2022 05:38:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nYPIm-0002kO-UL; Sun, 27 Mar 2022 05:35:17 -0400
Received: from [2a00:1450:4864:20::32f] (port=55199
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nYPIk-0002c6-5O; Sun, 27 Mar 2022 05:35:12 -0400
Received: by mail-wm1-x32f.google.com with SMTP id r64so6721007wmr.4;
 Sun, 27 Mar 2022 02:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TPa9Ien78uey/dBdpHJRkRyfhRQedcdj+KNczv+NRpI=;
 b=X8ZmBIblhNGiC47JsyOcrHvX1IQJspxMKy9jFOTYKK+fs/AO0+5rSFwBmj36qAdiwx
 sCZ7MdhyoU56fcmAF9DHeqRwCoiBPuzeAhiztOXQWPhodHMZVkR9j3Z7IwbWxD8bkr72
 WbFf3YI30EhLTJUvoqkuRzxb6ZV+ZtsGDgOjyCBRmXSrm3RK0I4GiqQaXWLRg/7TmBg+
 pbvvzhuCiEEdhi0UbT+riKoo25JCaKunA0YTzXFBf8Lvxpqo0b9zcNqDzT8rbyPNZagY
 /A2nyUNV+R+Am2c0rMwxeSttq/MOnN/CXPK7DYVeRyin/zgib4bA/gdq243Ct0TqqDXn
 n8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TPa9Ien78uey/dBdpHJRkRyfhRQedcdj+KNczv+NRpI=;
 b=dBumOegthUw69wXDJlJ4SMQ/DgK+YYSiAzk1SD0NCOZWYAzxfzgwoqEp1sx8ome7KO
 08merTo6WuC5nM8QglKVg/1Iz+WPx2dNNU2dM38/PxkMKOCfzTrvJ8qYAGY4wdhPjURK
 yiPU7YFxOMt0TsAYFYKUryh4gp/wcMBDYO7U4JK+u7B64FKfbc7Njy/c4CWmI1js+uJc
 zvRk4QtupMH7ff1GLc9ZAG8R1fv4T+mVhoxT3kcEpxjK3jZfGb7BRrHiglJqbr0Smlfs
 I0dokEsb9EKnZQ+ZS5GHW4B6aAT/nELC0M+03YC4Z5oJSwsoAZtIvQPFGxArz20DIeg/
 NjzA==
X-Gm-Message-State: AOAM533Vm9m+Tajqs6b13upquA+Ig43MrCJ7AhCEhygzgUVVhsF1Efk7
 jnm7Q5QBR20HuMr1SnpFCPgzmm7uYmo=
X-Received: by 2002:a7b:c77a:0:b0:38c:2c33:d8f1 with SMTP id
 x26-20020a7bc77a000000b0038c2c33d8f1mr27901509wmk.115.1648373694687; 
 Sun, 27 Mar 2022 02:34:54 -0700 (PDT)
Received: from li-142ea8cc-3370-11b2-a85c-c55585c2aa0e.ibm.com.com
 (bzq-79-183-80-20.red.bezeqint.net. [79.183.80.20])
 by smtp.gmail.com with ESMTPSA id
 14-20020a056000154e00b00203f8adde0csm11892039wry.32.2022.03.27.02.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 02:34:54 -0700 (PDT)
From: Idan Horowitz <idan.horowitz@gmail.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 0/3] Bug fixes related to secure 2 stage translation
Date: Sun, 27 Mar 2022 12:34:25 +0300
Message-Id: <20220327093427.1548629-1-idan.horowitz@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=idan.horowitz@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Idan Horowitz <idan.horowitz@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R3pLFX+KqX/+


Idan Horowitz (3):
  target/arm: Check VSTCR.SW when assigning the stage 2 output PA space
  target/arm: Take VSTCR.SW, VTCR.NSW into account in final stage 2 walk
  target/arm: Determine final stage 2 output PA space based on original
    IPA

 target/arm/helper.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 
2.35.1

