Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1400276lfp;
        Thu, 6 Feb 2020 04:52:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqwbrDlQ8cvy2sJdAYKGgLFWUX0XM4w0pdiMdrkmlzH4g+6lcnyAUoHthcyThRsF4NZgAiA2
X-Received: by 2002:ac8:540f:: with SMTP id b15mr2400683qtq.237.1580993574100;
        Thu, 06 Feb 2020 04:52:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580993574; cv=none;
        d=google.com; s=arc-20160816;
        b=dEEMOHme+w5CpKSbWotka34gTcHQRzy4aBZuxmnnAfqOOKRaMSdAyLyhK/f0UTyIdG
         NvD9or9qZlKyTpfXBzb0VjIRxwkzZPnSAhDsFpPdsIw5HIQNDAweX6MD5DHtmcJlt7Hg
         ODj7cNruzMleNy0GI6iHfoWZ0OSaXrpTG9Q13R76f9mtRuDpq/qJiAE1BwfILXg+VOwQ
         zqXVH/WleMPcig+m7YQQxuKefaZ9SWNE4twSSZ6GY0vm1xl2q4zQQXFrXZS0Qt7gQ+F6
         Q/106Rc5pstwehY3nlQZj1d4aCMyMToVWBNIPR+C2L2/CQC4NSV+7krzbljrzZZW87ZN
         kZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=20ek0lNiTEs3+l5ivLwqS6GS6ZoVEHYx31+iXxcr9GY=;
        b=ODoQ3vlK0CMFQPVQh1m1salAhMnO392DpwbqgcqNXMQSBNt4tUd6FscyB9kEy5znnc
         61ZjwmhSCH2QIUNWpLx9H+SIjuE/Co+2yodcQa+SUD/QhH/TTwQoFK+p5wQtVgJIjCow
         wT8WS8gSxYcGNPxSKkpp4NB20quGHmndvKwHyNYUUSnITNtSE7doIqhtlPI0DyA8319L
         u91IQGzhbrmwnMH+5FDYtoFV249I6O3YwvrQXMZjQhyKQRA3G+8NgNIb9a4CjtKfEeXL
         AxPP93dIQA1qrN4Z1M5wg2iMP7t+wHFGk1Iw0seDW+gaXM2CkfF19HU1sbSTTjwqsYY2
         n/8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si1389742qvo.6.2020.02.06.04.52.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 04:52:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izgeL-0004Mh-HD
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 07:52:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56375)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1izgcW-00013b-Tk
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:51:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1izgcV-00060N-OK
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:51:00 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:53311)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1izgcQ-0005b0-PN; Thu, 06 Feb 2020 07:50:55 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M9nlN-1iuTwk3gEX-005n7S; Thu, 06 Feb 2020 13:50:36 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/12] monitor: fix memory leak in
 monitor_fdset_dup_fd_find_remove
Date: Thu,  6 Feb 2020 13:50:17 +0100
Message-Id: <20200206125027.1926263-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200206125027.1926263-1-laurent@vivier.eu>
References: <20200206125027.1926263-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PkLbluZi6767fKHrm29TXI9V8f4/V582cxLm+KeDjydbCtXz7Bv
 Tn7ZXQuNi/17LtWUKlKFKQ4SXE9KVkFyDrTp5q/j8sJg2cvmifTj8/cHjHe07iJ2a4BHTxA
 GhwP3qNK4ScCXfEuN4ZqeXgB7g7xgA//KjXuh+IkAEdftV/uLQ0BMGbNLlMRKo3VShKUPfF
 lETwqwIygfPTzZOCoPlug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MyMkWIfuP24=:8fOiACXUsPJBRFpxPx71hE
 5P9iq32APsm62UHeKUGw9GnzBlx4CElui7p5rO4aPQxPr3YsZT4PXTbpfoR8p9YP9Xk5rWz3s
 erRqHPX1jR+cVRtRHxXhRzusn+EDMCYljbIqkkEdKunpvcfCUr+QBdy4C8E8ApOr1pVay4YQ/
 WCPnWWbr9GW6ZgYebmKU80PXSvRjV4/WTckPm0xel+36DPvD+HJn5WEDh2jDL/4Znpi0B2L9O
 rX07gehOAo3Pqv9mz+/FMpXVQUilMXNlldA1MVMWzolLoBuGcc9MHhMhSja2BsBpmEHmbtkup
 Q13eruMCYuJHO9Gmbuj30mcfDlkPkXaSjPX7+KCqJuNPiqWkxO26AR/muHyUWZeJ9VP994kFk
 xkQ5dm+ZEQChK9NrzsArGzD1lStIUodPGd5NNMjXutZggAXPm/iwJW/dVWsGYHgx61uzzoyKq
 9pMXCMMWwem0KrciygVqBudQPhdKB8GGIb0MJFEjpPz1cXlF7YBFB2fkI0n6hcEsA8A2oeoPg
 bqmnWr5LZtniSikc6/pwxbj51DqCHFX1bfzBsa2i30yd8bPpz2MbWRxHpgf/ImYhCQvl5GBjF
 jyKqO45o//hwKcKF+gbeDPwGgG59lOm9DGwWF2XIIuUndMvxGm14VxOwnKR+aQj0cGsYTJSLQ
 B9XRl1IIbhRM6g3a5lqdcMojVudEn/1Kymat2R0aTWXolEOj9zYmYs+ZkhiVESbs907c5QjHo
 BZto7rjLD7zhTpQsihgDIpdEcCJ0+9ifXt1ZGLiLgNHcYDTk6b0S7Mt7RGutKXaMHWUJON5X2
 0P0AXkBUIvHhQGpvi6mzvNJM09fTpC1+hnFxPjCIEFngIIhfdioooDJgkAp5y/TaE3inc8n
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Chen Qun <kuhn.chenqun@huawei.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Euler Robot <euler.robot@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tI2bLcoLV9wW

From: Chen Qun <kuhn.chenqun@huawei.com>

When remove dup_fd in monitor_fdset_dup_fd_find_remove function,
we need to free mon_fdset_fd_dup. ASAN shows memory leak stack:

Direct leak of 96 byte(s) in 3 object(s) allocated from:
    #0 0xfffd37b033b3 in __interceptor_calloc (/lib64/libasan.so.4+0xd33b3)
    #1 0xfffd375c71cb in g_malloc0 (/lib64/libglib-2.0.so.0+0x571cb)
    #2 0xaaae25bf1c17 in monitor_fdset_dup_fd_add /qemu/monitor/misc.c:1724
    #3 0xaaae265cfd8f in qemu_open /qemu/util/osdep.c:315
    #4 0xaaae264e2b2b in qmp_chardev_open_file_source /qemu/chardev/char-fd.c:122
    #5 0xaaae264e47cf in qmp_chardev_open_file /qemu/chardev/char-file.c:81
    #6 0xaaae264e118b in qemu_char_open /qemu/chardev/char.c:237
    #7 0xaaae264e118b in qemu_chardev_new /qemu/chardev/char.c:964
    #8 0xaaae264e1543 in qemu_chr_new_from_opts /qemu/chardev/char.c:680
    #9 0xaaae25e12e0f in chardev_init_func /qemu/vl.c:2083
    #10 0xaaae26603823 in qemu_opts_foreach /qemu/util/qemu-option.c:1170
    #11 0xaaae258c9787 in main /qemu/vl.c:4089
    #12 0xfffd35b80b9f in __libc_start_main (/lib64/libc.so.6+0x20b9f)
    #13 0xaaae258d7b63  (/qemu/build/aarch64-softmmu/qemu-system-aarch64+0x8b7b63)

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20200115072016.167252-1-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 monitor/misc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/monitor/misc.c b/monitor/misc.c
index 4752150a6780..9c3484d0a774 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1749,6 +1749,7 @@ static int64_t monitor_fdset_dup_fd_find_remove(int dup_fd, bool remove)
             if (mon_fdset_fd_dup->fd == dup_fd) {
                 if (remove) {
                     QLIST_REMOVE(mon_fdset_fd_dup, next);
+                    g_free(mon_fdset_fd_dup);
                     if (QLIST_EMPTY(&mon_fdset->dup_fds)) {
                         monitor_fdset_cleanup(mon_fdset);
                     }
-- 
2.24.1

