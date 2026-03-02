Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672B8C624C6
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 09:24:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vwzU5-0001Jj-PL; Mon, 02 Mar 2026 04:22:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vwzU4-0001IJ-CO
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 04:22:36 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vwzU2-0007h6-Ql
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 04:22:36 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4836f363d0dso36245735e9.3
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 01:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772443353; x=1773048153; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z+3TwwE4Ry7HQNnRAPzA+rv+0UHWjy6QT3dO96fhVFI=;
 b=gYVvjDkmPXVnt9J1wiq7izI4WgKf9TAdb4Pend0FL7VpBFA2dNLByanUO1i0UvoFjt
 4EOxNRiJkhZ0feLf1zoaQ6N716CLhivXwX5gDUClzPqJaY1MfHksuT+DgmMCZb/D6Lm+
 MNmfryQpKZe0/kY16z6Q6fN5wEoNfwevc7lkuFlZwh9MKqMJZvknAHzkbZJjxs7Uexwj
 5xr1Cf2aQLeEFDKhma3PEqmBn4MJh+aOmG1+rg4jCkCqLlKCgpCasTVs5FpS7FO/r2hb
 zgwxVByXQY+dKXCeB5FdftxUQePooSBYpONSmKUTVzD1lacH/S2bPzGfcLBP5Y/u4Rbw
 xG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772443353; x=1773048153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z+3TwwE4Ry7HQNnRAPzA+rv+0UHWjy6QT3dO96fhVFI=;
 b=NWvKvsWxFX4IIOPU637XlCkaJwPoM/+Kd7QJ3NG4BSVVSZSdhs+2w15FZPYRYMPWzm
 mfiVIJvecPxDP1l8bBGo0yUEZ329r9P5EI1sdf3JBS1+LMqSBwiagQIHXC12QxVa2mae
 wYS+s+FnY4d1O9Ej4+4S+WbcymgBEsgkXNQt8XpW3lsTTCojafBz8eP27PjyinLXOQZm
 DGt8zN+czNbl7UTSI6+7R/HED64014cIsNNW7L0a0btCjWdJJW1p4FeNrjZJo8Ge5JKv
 yYJogAoBJNguo36t3uJw8yWOXZaY+CrZuqzYHyqT3GWx5wXgQeCcmr9Q2zFmGlr8eEf6
 Q94A==
X-Gm-Message-State: AOJu0YwnrsEsDw1kNB0o6P4d3esStVUPUlM/effE51JVAFmyY/PX+ORx
 GANjS1T0yl98h1Q1sGQhPRClETjbvUxiDxKNkMxofhR9Mgwk/ujF+AAQqqiW89Bo7O/NfNRmFQR
 QFxpP
X-Gm-Gg: ATEYQzydaoM951+SClPdWR5/tFAHLS7wRpFLPM5x9BRp2vcgDskETK+eWMHlCVCKVGE
 0GfPAzNV9sZbPQ58sG3w6YdmoPzgtWr5ArFI/cCpxVVdsbstxW2Tuxvu+nxGUT8Sh3BPK2vDCVX
 1XHzrNMvATBpeg5ZVZ+Sdg8Ot+A/6o/n3V9EN5f5moQPiYYs3E6fC+df9jrNabwQKStiKyAp4Cu
 683kXaSeBweJgP+CZzmh+hEtkcntKtdh+GCbP+/y7p2WOF2xyQpn5VIwiTX+PbviIJla0gq1z9A
 UlwK95hWtapH9UXIDQR2jerntKpv/lDhvACP1XBNeebjEos2obUyLF0oNdmStouENGnfWYGnFkz
 IqwTiGayLm8qmVMQMXCqjFz5l4ocjLV9Syt0EagMQj4XdlrFQpzuRlfVoos2lHDWinOIuMUREvr
 Q1uyfzHjsAVwIskgA8D2Elfezoi+uASBAcMsYBNHlTpZlqojVB7l7JWQSEkVEzToH8H2ij49HCb
 uAUNZn1WWEOOatgbklXIpVBLw5o+Bk=
X-Received: by 2002:a05:600c:4e89:b0:483:129e:b573 with SMTP id
 5b1f17b1804b1-483c9bfb85bmr196468005e9.18.1772443353142; 
 Mon, 02 Mar 2026 01:22:33 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb9d9c6sm129435305e9.14.2026.03.02.01.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 01:22:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Yodel Eldar <yodel.eldar@yodel.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 5/9] chardev: Fix QIOChannel refcount
Date: Mon,  2 Mar 2026 09:22:21 +0000
Message-ID: <20260302092225.4088227-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302092225.4088227-1-peter.maydell@linaro.org>
References: <20260302092225.4088227-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Fabiano Rosas <farosas@suse.de>

The IOWatchPoll holds a reference to the iochannel while the "child"
source (iwp->src) is removed from the context and freed. Freeing the
source leads to the iochannel being also freed at
qio_channel_fd_source_finalize().

Later, io_watch_poll_prepare() tries to create another source with the
same iochannel and hits an use after free:

==8241==ERROR: AddressSanitizer: heap-use-after-free on address 0x514000000040
READ of size 8 at 0x514000000040 thread T2
    #0 0x561c2d272fcd in object_get_class  ../qom/object.c:1043:17
    #1 0x561c2d338f84 in QIO_CHANNEL_GET_CLASS  include/io/channel.h:29:1
    #2 0x561c2d33b26f in qio_channel_create_watch  ../io/channel.c:388:30
    #3 0x561c2d2f0993 in io_watch_poll_prepare  ../chardev/char-io.c:65:20
    ...

0x514000000040 is located 0 bytes inside of 392-byte region [0x514000000040,0x5140000001c8)
freed by thread T2 here:
    #0 0x561c2d2319a5 in free
    #1 0x7fb2c0926638 in g_free
    #2 0x561c2d276507 in object_finalize  ../qom/object.c:734:9
    #3 0x561c2d271d0d in object_unref  ../qom/object.c:1231:9
    #4 0x561c2d32ef1d in qio_channel_fd_source_finalize  ../io/channel-watch.c:95:5
    #5 0x7fb2c091d124 in g_source_unref_internal ../glib/gmain.c:2298
    #6 0x561c2d2f0b6c in io_watch_poll_prepare  ../chardev/char-io.c:71:9
    ...

previously allocated by thread T3 (connect) here:
    #0 0x561c2d231c69 in malloc
    #1 0x7fb2c0926518 in g_malloc
    #2 0x561c2d27246e in object_new_with_type  ../qom/object.c:767:15
    #3 0x561c2d272530 in object_new  ../qom/object.c:789:12
    #4 0x561c2d320193 in qio_channel_socket_new  ../io/channel-socket.c:64:31
    #5 0x561c2d308013 in tcp_chr_connect_client_async  ../chardev/char-socket.c:1181:12
    #6 0x561c2d3002e7 in qmp_chardev_open_socket_client  ../chardev/char-socket.c:1281:9
    ...

Fix the issue by incrementing the iochannel reference count when the
IOWatchPoll takes a reference and decrementing when it is finalized.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
[PMM: rebased]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 chardev/char-io.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/chardev/char-io.c b/chardev/char-io.c
index beac5cd245..0e5ba316ed 100644
--- a/chardev/char-io.c
+++ b/chardev/char-io.c
@@ -88,6 +88,9 @@ static gboolean io_watch_poll_dispatch(GSource *source, GSourceFunc callback,
 static void io_watch_poll_finalize(GSource *source)
 {
     IOWatchPoll *iwp = io_watch_poll_from_source(source);
+
+    object_unref(OBJECT(iwp->ioc));
+
     if (iwp->src) {
         g_source_destroy(iwp->src);
         g_source_unref(iwp->src);
@@ -117,6 +120,8 @@ GSource *io_add_watch_poll(Chardev *chr,
     iwp->fd_can_read = fd_can_read;
     iwp->opaque = user_data;
     iwp->ioc = ioc;
+    object_ref(OBJECT(iwp->ioc));
+
     iwp->fd_read = (GSourceFunc) fd_read;
     iwp->src = NULL;
     iwp->context = context;
-- 
2.43.0


