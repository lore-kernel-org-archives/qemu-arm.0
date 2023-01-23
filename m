Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3045677ejc;
        Mon, 23 Jan 2023 08:23:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/gTJZNhgBq2qt2Bbq5NOy9mSR4XqyxB2TDsVrLLxHL2gElZ2dgFJILf6i6ow+3vVgmbLXs
X-Received: by 2002:a0c:f181:0:b0:537:63fa:5963 with SMTP id m1-20020a0cf181000000b0053763fa5963mr503064qvl.47.1674491008143;
        Mon, 23 Jan 2023 08:23:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674491008; cv=none;
        d=google.com; s=arc-20160816;
        b=QW4YggRXL838gx2JfyDFkZCbg3h/riamQPKeY3GWOPoIMHQlV+phl4NGnv+mcSa0D9
         B93G4glwI2h936nvoJpN8/rUIpEZulQyQHBIuSSc6S4gCvhO99p1gVJsAwygYWS45BNi
         40e8q6OwPzT4oqamAVPs65JN5C2CMmlxDVsGqW5Nuav2Sw8RF/Rzv2qqa6WAL6YRgi3v
         Hmsy5wuJWqM7TiguTniuoYV6Qp7zcOcutx54Fa5rICdk3dJ8N0KWPqgYVlFddEPagTtZ
         CmNWbb/8XWCRr2otbv7XKzSvzeV5b4Rf+TGg05+iPs7lEyb8B5i761cQmQsKZIQEoGye
         JQ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=D4r48KVnk7ot18DtWCSTUBNmhBPIHZ6bG95OQJkFm5E=;
        b=p43F4LyBL8sDusbU7T/isO+OAHDwB/qyirDHzw9MrVIk0T4xcIfdxhEzQSmOpKSXXl
         sS/qobeQQMOmPmhlEzAiptnFkFAzEjtW5feQmaNv30QxI5yaGQBpS0J2EMVjd37aP5gS
         2BGbiXwHydt2BQn052s0KnkL5CoDdy0nSa35Cttw459xdncdbGjs8cfDCZDyz7b/YmS3
         +f+BAdX/yXoOIyMoStrp7xQ/qkaHJQS4ofWMU4PXgsxfKNTqvJsv9oFbGpGt2MF7oQJm
         ZYzpH5LMkfyWhUYSUGCK3ijmLUJR/7h9ha60Pe+SzmTzAFLWyd4HOJ5OU3oMU5OJ6WGt
         dyxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=B2iic5Ti;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id og3-20020a056214428300b00535748be2e4si6302065qvb.317.2023.01.23.08.23.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 08:23:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=B2iic5Ti;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pJzbI-0007bO-FT; Mon, 23 Jan 2023 11:23:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzbG-0007at-Sr; Mon, 23 Jan 2023 11:23:14 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzbF-0003a0-81; Mon, 23 Jan 2023 11:23:14 -0500
Received: from localhost.localdomain (unknown [77.64.253.114])
 by linux.microsoft.com (Postfix) with ESMTPSA id C824C20E1ABA;
 Mon, 23 Jan 2023 08:23:09 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C824C20E1ABA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674490990;
 bh=D4r48KVnk7ot18DtWCSTUBNmhBPIHZ6bG95OQJkFm5E=;
 h=From:To:Cc:Subject:Date:From;
 b=B2iic5TilhEFf/rbEu060LjiT/7DBM5xfcTCqYgMFsF7mKO87UNea/2/2NPcVRtvI
 7lIkci+SwVgSqPBX9aWSThoxk3lI4850dCGxBXg/A6Hx7DICqfJWBJ6s+c0BZQp+wP
 h/RfNBt1odBt5TLSpz6E5GcdqLG6N1CKCRK4s27o=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	philmd@linaro.org
Subject: [PATCH v4 0/5] Series of fixes for PL011 char device
Date: Mon, 23 Jan 2023 17:22:59 +0100
Message-Id: <20230123162304.26254-1-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: ianKkZTiGYI7

v4:
* Fixed post_load hook to be backwards-migratable
* Refactored some code in 5/5 as per review comments

v3:
* Introduced a post_load hook for PL011State migration for
  backwards-compatibility due to some input state fragility.
* No longer touching irq lines in reset method
* Minor changes based on review feedback.

v2:
* Moved FIFO depth refactoring part of FIFO flags change into its own
  commit.
* Added a reset method for PL011


Evgeny Iakovlev (5):
  hw/char/pl011: refactor FIFO depth handling code
  hw/char/pl011: add post_load hook for backwards-compatibility
  hw/char/pl011: implement a reset method
  hw/char/pl011: better handling of FIFO flags on LCR reset
  hw/char/pl011: check if UART is enabled before RX or TX operation

 hw/char/pl011.c         | 121 +++++++++++++++++++++++++++++++++-------
 include/hw/char/pl011.h |   5 +-
 2 files changed, 105 insertions(+), 21 deletions(-)

-- 
2.34.1

