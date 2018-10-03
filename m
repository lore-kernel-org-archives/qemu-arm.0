Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6435939wrt;
        Wed, 3 Oct 2018 08:12:45 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61RY+Af9kWefl+U93Y9eUWASXWUvzs1qwz7If8FJ7NEMfa5Q8tJyuvGGy6A470kSfDKGdUv
X-Received: by 2002:a0c:a9d2:: with SMTP id c18-v6mr1617570qvb.191.1538579565652;
        Wed, 03 Oct 2018 08:12:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538579565; cv=none;
        d=google.com; s=arc-20160816;
        b=D/yt+cVt0eUuUekSAm7d7q/FI3gKhaKw0w2TB+vmP79hvAVN/cNKRllMaG3U4tBYrz
         N+c36o0VmOimDyqlkgAsgVlS9+vNgT7jSjaemhkgkB6ANgoVrflrL6ZdRfFtyjRHD27J
         t0aCQ0tSsAfbtxYdC91phT/oJpuxs/cEwE+H1WP6ShTs8CXltRtwr/wl0y0Q4zb8ZSnB
         fmfuEWmBUat6m+HJ8rjzsE6OtJbGZYKxvLBxYtkNDJJgM4czxGdPUDpUk/rdduIFEZW/
         A48l9ws5/YQm0zox2W0LN24wJdgQu2axd4TcHsihPGVdm3tplosOE3a+0m+VoHdbjneh
         XNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=k1ktulAz8wi5AxnIcSy10JK17qd5NlNNQsw4wD+bjAI=;
        b=cfstU/7LKl9t1R+NlnXmmtDgopo7mMDhXEItTSN/5TxWDZMsS2Ze+M3Dj4ptsk7wd4
         WoTG15AMZAWAX9f1JFsSgFTiA/8ePB4ob6qIHH8rM8a2qjXqnfHRgU+9XnjodGAYh8kN
         YcLiQEIvNKJLP04wQq4xO3O+sUe4GkMFe4zeT+KTcNVWmLFh2SfkeCILoAqpZcwteTIj
         /Ov98zP2TMsSjb77t729wanJ33hwAmP9jwAUvIh1HKTMQvYUALG5tXixmuXEH6SUXJ8V
         k+5XjPSHtQfXFhIly+9SjYtydeoYxTqPCmjuvVsshRGYOLM960RlSOB5z66iONXfW7cU
         XbzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uz0Q6UJQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j5-v6si1026565qtl.368.2018.10.03.08.12.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 08:12:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uz0Q6UJQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7ipR-0000g5-4e
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 11:12:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7inY-0006bP-2q
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 11:10:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7inU-0004qF-DN
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 11:10:46 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42126)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1g7inO-0004oM-3c; Wed, 03 Oct 2018 11:10:38 -0400
Received: by mail-pf1-x444.google.com with SMTP id f26-v6so1681282pfn.9;
	Wed, 03 Oct 2018 08:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k1ktulAz8wi5AxnIcSy10JK17qd5NlNNQsw4wD+bjAI=;
	b=uz0Q6UJQuE6nTiLWzpwodlLzXDYVjnn4j5KJ8kvkl0ruGny4L+LxvAYOKby4WE7k67
	3s0KAVnwVXyGQr8rK/TF38AT2MkGrn6JTLiucJUK3/ECuunllX2iZqWbV9+SkdFSsfoS
	eq4CaI772fzc8Up+n25aTMr+thfKjz3GpdWBeCzHuNkPuGsRcV85tNxgun8x77Lzo6yf
	BK6qYWKugBF1MYyencxYVDKxsR6GpQEsRlf9PcecPREVA2K/slnZDm3c7C7bxtp1wcjr
	GkrIPW3UQumcruVwuflxy97Q4ubHR7mtCXQsSCYMnfqU8bWKpwRwyIYrcucZuyS2mpX9
	LBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=k1ktulAz8wi5AxnIcSy10JK17qd5NlNNQsw4wD+bjAI=;
	b=QoI6X+U8VZPDig2WFopnuTNgeQkFHVl5T/kBSupbmRj7Laqv7fijl5NkaSzJF2EB1Q
	zKAxJio6fDTJzEr7nt99WB9jehBX6pr0ArNYkTr6hSWkC72rMy2cgPAO6UwpH6YDsFg2
	Ksfs4PYd4aS2dPtwHtyMsqa+uJubl2e86aPDiNQBLjVghKE3MCOLiibkiKGgUY4O5Vhk
	UL3VyL4nQRHtXBEK87lNdmxc7uj6IbDnNi9Unoecp/tfxGM4wlIRi+AJlj1k+pOEXKOW
	ZUBkAmDW56OaBqHoaj9rnfTztDYzrvVdiGUlEn/NvhIs8TAguoEBoy1fdXAD3nDiwW5U
	ykjA==
X-Gm-Message-State: ABuFfohfIm2t5CVIiBxeNVMAZgYjs0hQVgLX4fVAqNg2Ahu6o8ut84M4
	Xhqc6axvqhXviLgRLM1yLqxlWR2mfRY=
X-Received: by 2002:aa7:8281:: with SMTP id s1-v6mr2044397pfm.63.1538579436675;
	Wed, 03 Oct 2018 08:10:36 -0700 (PDT)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	o2-v6sm6118684pfj.57.2018.10.03.08.10.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 08:10:35 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed,  3 Oct 2018 22:07:38 +0700
Message-Id: <1538579266-8389-5-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH v1 04/12] net: cadence_gem: Add macro with max
 number of descriptor words
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ohuoqdvLSlXh

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add macro with max number of DMA descriptor words.
No functional change.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c         | 4 ++--
 include/hw/net/cadence_gem.h | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 31f3fe0..4d769b0 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1042,7 +1042,7 @@ static void gem_transmit_updatestats(CadenceGEMState *s, const uint8_t *packet,
  */
 static void gem_transmit(CadenceGEMState *s)
 {
-    uint32_t desc[2];
+    uint32_t desc[DESC_MAX_NUM_WORDS];
     hwaddr packet_desc_addr;
     uint8_t     tx_packet[2048];
     uint8_t     *p;
@@ -1108,7 +1108,7 @@ static void gem_transmit(CadenceGEMState *s)
 
             /* Last descriptor for this packet; hand the whole thing off */
             if (tx_desc_get_last(desc)) {
-                uint32_t desc_first[2];
+                uint32_t desc_first[DESC_MAX_NUM_WORDS];
 
                 /* Modify the 1st descriptor of this packet to be owned by
                  * the processor.
diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
index 633d564..b33ef65 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -32,6 +32,9 @@
 
 #define CADENCE_GEM_MAXREG        (0x00000800 / 4) /* Last valid GEM address */
 
+/* Max number of words in a DMA descriptor.  */
+#define DESC_MAX_NUM_WORDS              2
+
 #define MAX_PRIORITY_QUEUES             8
 #define MAX_TYPE1_SCREENERS             16
 #define MAX_TYPE2_SCREENERS             16
@@ -74,7 +77,7 @@ typedef struct CadenceGEMState {
 
     uint8_t can_rx_state; /* Debug only */
 
-    uint32_t rx_desc[MAX_PRIORITY_QUEUES][2];
+    uint32_t rx_desc[MAX_PRIORITY_QUEUES][DESC_MAX_NUM_WORDS];
 
     bool sar_active[4];
 } CadenceGEMState;
-- 
2.7.4

