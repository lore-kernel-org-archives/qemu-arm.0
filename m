Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp3990556ejv;
        Tue, 2 Apr 2024 07:27:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2k59KysgizAI11eaCJ/H9P19gxOKrrBi6QEvFWSRT/1CHjLo/9VjInUkivpE/DajY+s5kRkGBUzF/b3O+p84FdBzktO1W
X-Google-Smtp-Source: AGHT+IGRa9QeUljqX4rt10MDLzaNBwraRhaEuE3XCH/3/QddQT6hqbx+NumHv9OZtTTrslfgM16V
X-Received: by 2002:ad4:4f08:0:b0:699:18d3:8fd4 with SMTP id fb8-20020ad44f08000000b0069918d38fd4mr2566758qvb.14.1712068051608;
        Tue, 02 Apr 2024 07:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712068051; cv=none;
        d=google.com; s=arc-20160816;
        b=Vw42iQ39/HSxMZKX5YH/33INus2UMGysXoJGDZ/OQUpP7LiivDB5PqFH2n5azgvQVc
         98txtAueoEQByeHC8vS5UKibWaNmlUZjXMC4Mcea85cfkedt+5mAlkt9rROeNZin8cWS
         gGTpzbWndETAFyqXIvHzgnuCvG50gnq94hrNNWurrecVfdAmTeGVE05hT6DKWGdOZD3e
         0+2yYJMiEWZ8O3IKTBOA1Lr1BJZIX+qY2kUlaBfgnHlseWmN25EhU85b3rwgOfMeg6tf
         jk+F3pcaK1HUnZPMDotB6M6IjYvfh488RTzpUuFbGTBoFwSWeTMVEabN/6QvLNJHx7Rm
         U2Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LiQNL8qlUJUwVLo8ka7ZFh5OPYv1xBVi+fy9VmqgzRE=;
        fh=LBYmd/IWTzj+P2FvIe078FYe/LhfgP+XnibuKKHNYQs=;
        b=M8EPb0udIwR/nqYh8f9fyiRbPrwm0XMLpW3UCTeELrpKcAluKrB4ju59lZuOPYAErH
         WSNv9jProO69LIe3lGDJW4vw29rgZbGwSfk4YQ6yBK8ZnUIJQI6lZmvJLZxHV4GPMa7F
         W6d7MyO2JiZISI225zZwjcyia+ikJinpbOB9BBD+2YaY0Y5EIDaAR/y43liwgTj3OPTd
         Uh5D59SJhfg5E522QgxhNmWBY/ODCFB8cbQl9LcCnXVr/buZXJeP+dvjjhLUCrG1a6j6
         rx30hZzqerv5jeIIzrl861SvseQw91hHutjj/WXw5nlmBhJxi0hFzgfLxFeLUbFTF3NL
         inCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lYzBQOB5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14-20020a056214032e00b00696a3860886si11919774qvu.201.2024.04.02.07.27.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2024 07:27:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lYzBQOB5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrf6b-0004Td-2i; Tue, 02 Apr 2024 10:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrf60-0003KJ-1u
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 10:26:44 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrf5q-0000XY-Fs
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 10:26:33 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-415446af364so26340055e9.0
 for <qemu-arm@nongnu.org>; Tue, 02 Apr 2024 07:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712067976; x=1712672776; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LiQNL8qlUJUwVLo8ka7ZFh5OPYv1xBVi+fy9VmqgzRE=;
 b=lYzBQOB5xsn43gK0Cwk6kH7vdBEUOyARdDJv+GMWThn/j/uprIrJ+5xDju6+k2h9Yd
 OZzvBai9M9LUsBu+p/qQTBAYIwmrK0xAr1RqlFheoZB9IAOklLpbacaXK6nbDNoseX2d
 8ChOnaUEEj7LnIeh40pHlzak5qUE2/HW9x46VYr2c2FhVammZ69x2nGyBo94aGh/lqA1
 W6GYkYedEHSch55Gk/CFSiD99h6Xd3I1fP9CPcoJdltKqbfMvqw5MtIwzgNL44VDZ0ji
 eFM7mZ6Y8+uEIlrAEI0xPQsi6Yt1cAwXxj4XP65JW71FPoBsBeAjIh/9l9zTRf9vn/2m
 Nepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712067976; x=1712672776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LiQNL8qlUJUwVLo8ka7ZFh5OPYv1xBVi+fy9VmqgzRE=;
 b=dhR0wRHX25BG+3DuRtqVbeUFCEYrw6eJE+2et9kT51NfvRMWbmfYhQuv66nj6zbUvY
 dZggXu4AI7sycK3d+/1OY+R3q6My97GLsTVrGXZBQK+v/UCKXo0Ex/MQSisc8SQmEom9
 htcw6NMcG/B4f1YYpvk7se3udRfBW+3utyPO0HEu2YmIo3vm/WRLoBthNs4uqQboY/eE
 diDXk5QOwHMGOBAJeyp6yLhyVsIPP/auBNzwrZHxx4fWhb0l0UzLmJqNvHGXfVc2KG7Q
 TCrAPweGfacvuAxx6OYtLkAM2HMKl1O8VimK42p3dZjVLNiXPsAf32cWEVZbkGWaMoIJ
 mI6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE4Mr3vQEDphVfPkA9KjxWwCuX1PrMMP/ttwAd3NQQHCGSuyNmZFV3z3jdmY9hCoiPaSl/IiWwL1eHkA+I0J8ljzMf
X-Gm-Message-State: AOJu0YyekOMHG3cNFGV4DS+sdenWZQ4sFBHJ5AmCqsopCMUXe77WprXW
 JTlzZUDERQle+sq4r2FGKcoXYlVMZyhIZlLpB0weHY8xkQLJ6yv5gyKHy5hG5Q4=
X-Received: by 2002:adf:f108:0:b0:33e:c68d:d536 with SMTP id
 r8-20020adff108000000b0033ec68dd536mr10768328wro.15.1712067975793; 
 Tue, 02 Apr 2024 07:26:15 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.202.91])
 by smtp.gmail.com with ESMTPSA id
 dn13-20020a0560000c0d00b00341b7d5054bsm14389989wrb.72.2024.04.02.07.26.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Apr 2024 07:26:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Yajun Wu <yajunw@nvidia.com>, Jiri Pirko <jiri@nvidia.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 15/15] hw/net/virtio-net: fix qemu set used ring flag even
 vhost started
Date: Tue,  2 Apr 2024 16:24:30 +0200
Message-ID: <20240402142431.70700-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240402142431.70700-1-philmd@linaro.org>
References: <20240402142431.70700-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: cgLdC7TcvtoT

From: Yajun Wu <yajunw@nvidia.com>

When vhost-user or vhost-kernel is handling virtio net datapath,
QEMU should not touch used ring.

But with vhost-user socket reconnect scenario, in a very rare case
(has pending kick event). VRING_USED_F_NO_NOTIFY is set by QEMU in
following code path:

	#0  virtio_queue_split_set_notification (vq=0x7ff5f4c920a8, enable=0) at ../hw/virtio/virtio.c:511
	#1  0x0000559d6dbf033b in virtio_queue_set_notification (vq=0x7ff5f4c920a8, enable=0) at ../hw/virtio/virtio.c:576
	#2  0x0000559d6dbbbdbc in virtio_net_handle_tx_bh (vdev=0x559d703a6aa0, vq=0x7ff5f4c920a8) at ../hw/net/virtio-net.c:2801
	#3  0x0000559d6dbf4791 in virtio_queue_notify_vq (vq=0x7ff5f4c920a8) at ../hw/virtio/virtio.c:2248
	#4  0x0000559d6dbf79da in virtio_queue_host_notifier_read (n=0x7ff5f4c9211c) at ../hw/virtio/virtio.c:3525
	#5  0x0000559d6d9a5814 in virtio_bus_cleanup_host_notifier (bus=0x559d703a6a20, n=1) at ../hw/virtio/virtio-bus.c:321
	#6  0x0000559d6dbf83c9 in virtio_device_stop_ioeventfd_impl (vdev=0x559d703a6aa0) at ../hw/virtio/virtio.c:3774
	#7  0x0000559d6d9a55c8 in virtio_bus_stop_ioeventfd (bus=0x559d703a6a20) at ../hw/virtio/virtio-bus.c:259
	#8  0x0000559d6d9a53e8 in virtio_bus_grab_ioeventfd (bus=0x559d703a6a20) at ../hw/virtio/virtio-bus.c:199
	#9  0x0000559d6dbf841c in virtio_device_grab_ioeventfd (vdev=0x559d703a6aa0) at ../hw/virtio/virtio.c:3783
	#10 0x0000559d6d9bde18 in vhost_dev_enable_notifiers (hdev=0x559d707edd70, vdev=0x559d703a6aa0) at ../hw/virtio/vhost.c:1592
	#11 0x0000559d6d89a0b8 in vhost_net_start_one (net=0x559d707edd70, dev=0x559d703a6aa0) at ../hw/net/vhost_net.c:266
	#12 0x0000559d6d89a6df in vhost_net_start (dev=0x559d703a6aa0, ncs=0x559d7048d890, data_queue_pairs=31, cvq=0) at ../hw/net/vhost_net.c:412
	#13 0x0000559d6dbb5b89 in virtio_net_vhost_status (n=0x559d703a6aa0, status=15 '\017') at ../hw/net/virtio-net.c:311
	#14 0x0000559d6dbb5e34 in virtio_net_set_status (vdev=0x559d703a6aa0, status=15 '\017') at ../hw/net/virtio-net.c:392
	#15 0x0000559d6dbb60d8 in virtio_net_set_link_status (nc=0x559d7048d890) at ../hw/net/virtio-net.c:455
	#16 0x0000559d6da64863 in qmp_set_link (name=0x559d6f0b83d0 "hostnet1", up=true, errp=0x7ffdd76569f0) at ../net/net.c:1459
	#17 0x0000559d6da7226e in net_vhost_user_event (opaque=0x559d6f0b83d0, event=CHR_EVENT_OPENED) at ../net/vhost-user.c:301
	#18 0x0000559d6ddc7f63 in chr_be_event (s=0x559d6f2ffea0, event=CHR_EVENT_OPENED) at ../chardev/char.c:62
	#19 0x0000559d6ddc7fdc in qemu_chr_be_event (s=0x559d6f2ffea0, event=CHR_EVENT_OPENED) at ../chardev/char.c:82

This issue causes guest kernel stop kicking device and traffic stop.

Add vhost_started check in virtio_net_handle_tx_bh to fix this wrong
VRING_USED_F_NO_NOTIFY set.

Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Reviewed-by: Jiri Pirko <jiri@nvidia.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <20240402045109.97729-1-yajunw@nvidia.com>
[PMD: Use unlikely()]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/virtio-net.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index a6ff000cd9..58014a92ad 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -2865,6 +2865,10 @@ static void virtio_net_handle_tx_bh(VirtIODevice *vdev, VirtQueue *vq)
     VirtIONet *n = VIRTIO_NET(vdev);
     VirtIONetQueue *q = &n->vqs[vq2q(virtio_get_queue_index(vq))];
 
+    if (unlikely(n->vhost_started)) {
+        return;
+    }
+
     if (unlikely((n->status & VIRTIO_NET_S_LINK_UP) == 0)) {
         virtio_net_drop_tx_queue_data(vdev, vq);
         return;
-- 
2.41.0

