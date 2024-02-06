Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1944236ejb;
        Tue, 6 Feb 2024 09:13:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOs7K6OjZYbo0UcYvkIxe9tbkuSZUKPpKsxsu0Po/E6v+iMq5oO7WTGnxK+EPAAFtZvKUQ
X-Received: by 2002:ac8:51c6:0:b0:42c:344b:a0ab with SMTP id d6-20020ac851c6000000b0042c344ba0abmr2303012qtn.34.1707239581428;
        Tue, 06 Feb 2024 09:13:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707239581; cv=none;
        d=google.com; s=arc-20160816;
        b=zRDieUdYcWEN5KCmMMaM8JEbO4K+UNmW3hO3B+/aHDJXo/Jsq2YJ/yxI8JpoAc9Rs6
         BQtw8UxUovXsJZvkJw87raeL1dEVpB9dqm+W0z9OYeLZyiYn18xNu8v97eWgEdn+77+u
         J+qsR+6zRte+AmccgpG3zdvs0j9vFmNe/gVWjZIIXxMspAXEjcnTXpV4jKy20U6CqpnL
         uy1iUFpl8V1TkxOI3vU8CD1X3bBXfpKGa4fKLZcL/id+1iRnZysm8K5192BjgP679QJL
         yjyF0/co/PRdjeYZd/WvLzwmqjkFP/xOpGnB25R46oCVFIltq6lXJYpmnJPSQ/cbw5Os
         03Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=i1dFzNuelN4CWZqr8uaEvSpqTVCt5LiE59TikMBDyIk=;
        fh=JW2X3tYGDrmhm+ptBu3HnYvD57wzqyt65P+KtKFqS9o=;
        b=CihKk1cYysWxRfYLIq3S/fnBBebKMdpbrs3cfC+2sNvJAi3Zcrx7vsExKDfUF4Qf0Q
         CyZp+wwP/U3J8r4VEXjhPOat5H+nWTCdr6plQ2Tq8WwH0pEsm3NfeCwQU9FeEAfo2ZI1
         Gowvey5PqG4d9SHlTdlRp592DMH9rQI72Zs0mDIba2SAlss1gF6yD/Rl4hDD9SYEMnpk
         b0eQU9odXtnC+SbDmq7oK7LrTx/+yS9qJsCJgmyRQQmNOZk405qMVhexS68uBWegaZ66
         12kHa3Bqiz0sT0tDNJKJxau3PhqrNnn4g0Rt48UttDrbzNG9iTpb9mIErsgpnCCpxUUN
         +bbw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HVHQw1ll;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCVO2bHElkCFVXhrYIoKTDxBtCApCQ1ry2UcOkux3TfwNrw9YsuZ9jhfuRINCEWdl42jt1QlfYKpauTUmop7cH+Y8BJT5N3C
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e19-20020ac85dd3000000b0042c26382d90si2718736qtx.161.2024.02.06.09.13.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 09:13:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HVHQw1ll;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXOzt-0003ol-2S; Tue, 06 Feb 2024 12:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXOzs-0003oN-AT
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 12:12:36 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXOzq-0003XU-Fs
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 12:12:36 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40fc6343bd2so40112605e9.1
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 09:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707239552; x=1707844352; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i1dFzNuelN4CWZqr8uaEvSpqTVCt5LiE59TikMBDyIk=;
 b=HVHQw1lljTt6F5XRIOwezXXBOWQhId6Qa2Py057iB+02/umEzxPgzuSIXAjnTG3Ea1
 QKiM16pX1YkCb5JnlYgHYrworVDhuTHl+QGHIGYWqMWgJZQGqvruDi0T4ktkQY+c/Zpv
 mWvT+4MYQ4A2nxPj2TnJgeRswSlOxjQ5dKOwtJVI2nHdPzg98E/oAB+Ywn84vzys0XQZ
 kfC9WdufeYgxn6+SRKJp+t2o5VJ2ECj6Gotc4jAxxO+E7Mb4CyYNnPeNAMNLYv/TDt78
 NbFO9VeMQczOHeU66jT8+H6VQ98mY1NW22yzxTVGj3mYkynLmHU5km+/5IizuQEM+Tyz
 0Qpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707239552; x=1707844352;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i1dFzNuelN4CWZqr8uaEvSpqTVCt5LiE59TikMBDyIk=;
 b=H/EAhy373uinn8KttxoVVDdyidOdo1NPc8Rj7J+bfsBG8NPrdmLwg4rpg6qTFRGsKn
 /bxhYQpVQB8TKVgh7kkRgnaXLLJCKl0qHBPfiohyKcKsli4W2GWb4DgOYu8V5NaUdcpH
 EnKAxmKUIXDy6OxCz6Sr2wbJTOcGWdHKOVcWGgrktSgTMHgoZfWR9LviL8weo/S7DZIF
 QDJUYycxIx3t+rTgRQNUXkfaVko7N9Jt8/Sa+gp7UW36Kyv4gLX0wYQVT+nvGa/5w/z2
 3WPs5Dowuq0yTEqORs8EudcjbSUqlpYaSD62SSkYsGL0og6qLbajUgflPt68aCArm+ao
 32wg==
X-Gm-Message-State: AOJu0YxivfFATO8SW3uAu+bVIqEYEZ2opwvSJMN/oMlQPoGXQa906KDE
 v2FAwwqCRNbM7yM2NXT3SwjuXOjk5lOWsWe0JgTP0ZMOuFIS5OiN4+Ly4wkjGVieQedjI5QDrms
 0
X-Received: by 2002:a5d:47a2:0:b0:33b:4965:cccc with SMTP id
 2-20020a5d47a2000000b0033b4965ccccmr1571429wrb.46.1707239552588; 
 Tue, 06 Feb 2024 09:12:32 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUKznLtooHjIW2Bm+BaK38iaM0PGz7R34U1So5C0PMAab14I/eAsmQYs4UlPdGilstXIOXUqnndWqtqODn9mZFQuy1AwrkqP96UBIvorPhK3YTcqIch0WOvzI03mwBGp+d8GHX9mPK3wAZgJyuUXC6UpZ4B
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a5d4bcc000000b0033905a60689sm2561284wrt.45.2024.02.06.09.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 09:12:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
 Nabih Estefan <nabihestefan@google.com>, Hao Wu <wuhaotsh@google.com>
Subject: [PATCH 0/2] Fix issues with npcm7xx and recent NIC cleanup
Date: Tue,  6 Feb 2024 17:12:29 +0000
Message-Id: <20240206171231.396392-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: OkB+t2Yt7Aht

The changes to the NPCM7xx to add the GMAC devices crossed in the mail
with the NIC cleanup patchset, which had a couple of unfortunate results:
 * no qemu_configure_nic_device() call for the GMAC modules
 * the npcm7xx_emc-test produces some spurious warnings

This patchset fixes both of those. Arguably patch 2 shouldn't
be necessary, as the "nic foo has no peer" warning is a bit
overzealous for NICs that always exist on the board, but I preferred
the simple approach of silencing it rather than spending ages trying
to figure out what the "right" condition for the warning should be.

thanks
-- PMM

Peter Maydell (2):
  hw/arm/npcm7xx: Call qemu_configure_nic_device() for GMAC modules
  tests/qtest/npcm7xx_emc-test: Connect all NICs to a backend

 hw/arm/npcm7xx.c               | 1 +
 tests/qtest/npcm7xx_emc-test.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.34.1

