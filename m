Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp52146lfj;
        Thu, 13 Jan 2022 08:00:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFC/TNt4gw+B65Rp1JWgg8HGb6I3wIBvpB02jyF/cfbFNZZfLUP3h5AM2abrXHXJZtMD+W
X-Received: by 2002:a25:6d0a:: with SMTP id i10mr6607948ybc.353.1642089614969;
        Thu, 13 Jan 2022 08:00:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642089614; cv=none;
        d=google.com; s=arc-20160816;
        b=Z3/1yCsS9hG4Myw5LCYmRu9HrOUSLMMyiilShfsB+t6uM/8vLZuoSiYNC7yjtVRj0p
         ku07NFZ8soHMw8kicpR62fF1dX8BjxrfTwTzO1DrVfy6sG2wqdahfa5bx0XORAv2wkr/
         MuhB/rY0uZ8A/D+wXVQ1CbvnuuCbfg7VoafXInzcbbm1pkDU2b6q5quTNfvxq26kcUdU
         nDD6ClQsxTwSXLBucWEg9yHi5LGR5flmVstOEwsBL8zvRQSPT+0IZmpQ8ygGvUPtz1qg
         5Nd2s75W1ipcreOYdcV4YreN7qNyKFI2wd1MzhwhbYF/WKt6Rm94ds38CJGz5RqLaeaR
         PHcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature
         :dkim-signature;
        bh=eYQjtCr+5dTwNm0r1J0q48aNyuOqDigZ1BF1YTDklTI=;
        b=NT0qq3tCzyAAzpKAe/lQi2i5CJiEs+ODL/g7lzu62LeuUM7daYj7ZVJjDgYbPB2+NU
         Lky480agrX7SG1MQ3UxoXHNvAkQkCRN1i88NUSHlyRWWITMA4ssfidXIvT3nodOYjjGI
         IhVP4o2GiI7BVpOA263AiYL6DTd2l/H5D7sbfwyEQCD5Oc6j9FX1I8KpkaTFqp0XmjOK
         rWQL6rqwryzCmJ4zIYZlESFTdWrk1kEKup3KhETf6V81SO92Ja29wU53QT5wySIKtiy7
         ZEmeS5IoH8r72Ewd+Ua56DoQyCHvb4nyNpvwFM0SMiItcyzdHNgv8AhJZCR8lCjyP9vp
         3K9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.cz header.s=susede2_rsa header.b=dwR6Jtuu;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l64si2973014ybf.127.2022.01.13.08.00.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jan 2022 08:00:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.cz header.s=susede2_rsa header.b=dwR6Jtuu;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n82WM-00045k-6N
	for alex.bennee@linaro.org; Thu, 13 Jan 2022 11:00:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppavlu@suse.cz>)
 id 1n81t7-0007A4-PJ; Thu, 13 Jan 2022 10:19:41 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:44104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ppavlu@suse.cz>)
 id 1n81t6-0006hs-9N; Thu, 13 Jan 2022 10:19:41 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 16A0E210EC;
 Thu, 13 Jan 2022 15:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642087177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eYQjtCr+5dTwNm0r1J0q48aNyuOqDigZ1BF1YTDklTI=;
 b=dwR6Jtuu9q3xFY0r1yQkfTC0+slcbu+FjPsys+B6XO1YqAqXHGMd46LdQ4sbFMUruNHJVr
 9Lm1Aa7SMvFrUHQJ3rYhLqwhcw6IQZijnsF5aZO8P6XNPTsSQpuBXY0aUUmTwKxDGrPOFO
 +R5d2Y3NsClVZldUZkKmePNDRGfj4R0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642087177;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eYQjtCr+5dTwNm0r1J0q48aNyuOqDigZ1BF1YTDklTI=;
 b=0FVPD0vwrQyvskf2he7t1RvhO6xB8fKtWLJlfupgOZ9yJa0c0Z6rcOdIimBNQUd+Ws0IaG
 rtrGTgArNi+B9tAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC95813DD1;
 Thu, 13 Jan 2022 15:19:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0zciOQhD4GEwFAAAMHmgww
 (envelope-from <ppavlu@suse.cz>); Thu, 13 Jan 2022 15:19:36 +0000
From: Petr Pavlu <ppavlu@suse.cz>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] hw/intc/arm_gic: Allow reset of the running priority
Date: Thu, 13 Jan 2022 16:19:14 +0100
Message-Id: <20220113151916.17978-1-ppavlu@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=ppavlu@suse.cz;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 13 Jan 2022 10:59:43 -0500
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
Cc: petr.pavlu@suse.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QyglvScsocKp

Thank you Peter for review of the first version of the patch. v2 splits
the changes into two commits and updates the code as suggested.


