Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB21F606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=A5WTWl0u
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMN54-0003MB-Ug; Thu, 29 Oct 2026 06:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <junjie.cao@linux.dev>)
 id 1xMN52-0003LY-Nr
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 06:09:56 -0400
Received: from out-81.mta1.migadu.com ([95.215.58.81] helo=mta1.migadu.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <junjie.cao@linux.dev>)
 id 1xMN50-0001y3-QI
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 06:09:56 -0400
X-Envelope-To: qemu-arm@nongnu.org
DKIM-Signature: a=rsa-sha256; bh=K5Nyk1dLtyEiTe3Nt5+w40Po+63yQPbItxXWE1MJbfQ=; 
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793268592; v=1; x=1793873392;
 b=A5WTWl0u2dSObSL1rcZ/zLU5OrYw0ol0ZJ6oaHzosb38b06VtjtP3ERMU6EMExWzwKarw07q
 wxUhKqQryINNqmRiv11bni4GB9nwwfAxuzAZbTsPK4+JhTlDpvApae/I6wjX6WHEn+71HPjad+i
 W7MsrfO+eQ+KCMECIXJELXqg=
X-Envelope-To: qemu-arm@nongnu.org
Received: by smtp.migadu.com with ESMTPS id ff8dc8429106f670;
 Thu, 29 Oct 2026 10:09:52 +0000
X-Mizu-Trace-ID: ff8dc8429106f670
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: jamin_lin@aspeedtech.com, kraxel@redhat.com, marcandre.lureau@redhat.com
Cc: clg@kaod.org, peter.maydell@linaro.org, kane_chen@aspeedtech.com,
 troy_lee@aspeedtech.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 junjie.cao@intel.com, junjie.cao@linux.dev
Subject: Re: [PATCH v7 4/8] hw/usb/redirect-server: Announce the exported
 device
Date: Thu, 29 Oct 2026 05:09:41 -0500
Message-ID: <20261029100942.894066-2-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028034140.367393-5-jamin_lin@aspeedtech.com>
References: <20261028034140.367393-1-jamin_lin@aspeedtech.com>
 <20261028034140.367393-5-jamin_lin@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.215.58.81; envelope-from=junjie.cao@linux.dev;
 helo=mta1.migadu.com
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

Hi Jamin,

On Wed, Oct 28, 2026 at 03:41:45AM +0000, Jamin Lin wrote:
> +    /* The parser calls these directly, so they must not be NULL. */
> +    s->parser->filter_reject_func = usbredir_server_filter_reject;

start_iso_stream_func, stop_iso_stream_func and iso_packet_func are
still NULL at the end of the series, and the parser accepts those
messages without any capability.

I exported usb-audio to a client QEMU (qemu-xhci, Debian guest) and ran
aplay there. Once the guest picks the streaming alt setting, ep_info
lists the isochronous endpoint, redirect.c sends start_iso_stream, and
the exporting QEMU segfaults on a NULL call in usbredirparser_do_read().

Could the server install these and refuse the stream until it supports
isochronous transfers?

Thanks,
Junjie

