Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700EB606A327
	for <qemu-arm@archiver.kernel.org>; Sun, 15 Nov 2026 15:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Hl7W+SwI
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xSbmb-0007tZ-4I; Sun, 15 Nov 2026 10:04:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <junjie.cao@linux.dev>)
 id 1xSbmV-0007sm-F3
 for qemu-arm@nongnu.org; Sun, 15 Nov 2026 10:04:37 -0500
Received: from out-214.mta0.migadu.com ([2001:41d0:1004:224b::d6]
 helo=mta0.migadu.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <junjie.cao@linux.dev>)
 id 1xSbmT-0003Tk-C1
 for qemu-arm@nongnu.org; Sun, 15 Nov 2026 10:04:34 -0500
X-Envelope-To: qemu-arm@nongnu.org
DKIM-Signature: a=rsa-sha256; bh=nPKUOhKzk88267WTnZC+BhfvJDjbFcVQONJE5o9YV7c=; 
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794755069; v=1; x=1795359869;
 b=Hl7W+SwIJCvpp/F3ZrfqAD9i+rSRfZl7vWIyBH+bG97n6HEBLOLATCDkEuoQ4CAEjZ5m0trN
 WcfEW/0szLWv2V6BH8jLtWsbVRih1xRZJKRWO0/zuKhBeGbrWWCbZezlBByAjk9U9aW0QXsk+HO
 8L3N48Rh3Hz4T9nclsKtUCWc=
X-Envelope-To: qemu-arm@nongnu.org
Received: by smtp.migadu.com with ESMTPS id 3acce0f40d080449;
 Sun, 15 Nov 2026 15:04:29 +0000
X-Mizu-Trace-ID: 3acce0f40d080449
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: jamin_lin@aspeedtech.com
Cc: berrange@redhat.com, kraxel@redhat.com, marcandre.lureau@redhat.com,
 clg@kaod.org, pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 kane_chen@aspeedtech.com, philmd@oss.qualcomm.com, kfting@nuvoton.com,
 wuhaotsh@google.com, zhao1.liu@intel.com, richard.henderson@linaro.org,
 deller@gmx.de, sstabellini@kernel.org, anthony@xenproject.org,
 edgar.iglesias@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, troy_lee@aspeedtech.com,
 junjie.cao@linux.dev
Subject: Re: [PATCH v9 14/19] hw/usb/redirect-server: Implement control
 transfers
Date: Sun, 15 Nov 2026 09:04:18 -0600
Message-ID: <20261115150419.1309675-1-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110072818.2883349-15-jamin_lin@aspeedtech.com>
References: <20261110072818.2883349-15-jamin_lin@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:1004:224b::d6;
 envelope-from=junjie.cao@linux.dev; helo=mta0.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Both issues I raised on v8 are fixed: the hello/control case and reset
with pending requests now behave as expected.

Junjie

