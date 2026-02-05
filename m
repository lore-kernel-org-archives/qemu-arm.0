Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AE2ECD999
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 20:01:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vo5VD-0006bQ-7c; Thu, 05 Feb 2026 14:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vo5VB-0006aX-Ty
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 14:58:58 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vo5VA-00034m-1I
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 14:58:57 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4806d23e9f1so15443435e9.2
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 11:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770321534; x=1770926334; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KJHws2bGwjwBm9rF5KtccgfLM9W22L+zuBOlFcWoRxA=;
 b=GnLcaF/lEwM/Z/assz+xWQzBGfEq3ZyBAxgrr9lOrdmLP62niD6f/e9PZeI+cBdtwm
 wLYNBQ5KtREOAPVZghg14ERpDmK+Lv8Y0KFzzXc+E6u4C7aksnZNoIwFlLtWOukeN5XC
 DaeCSJ9DWo3yW/UIVlweGSh7veiiHAIHCjTwDgyr/JQ7PyIXgNBgBgUg0RC8vHN+vxFo
 2ne4dRQ2iPJCq7cxAB7DhmM5Y6GcKrhMcseft5QlD9pa5A+2p4v1qirQfv28Ygs72g1y
 ell4ut/wS4/YkRLtomQN+/SQ5RREfFjxfAFMPUN0F7Ax3IefIcin5oYmVQ6v+SxEX+1k
 VhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770321534; x=1770926334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KJHws2bGwjwBm9rF5KtccgfLM9W22L+zuBOlFcWoRxA=;
 b=Js9yjljlBg2LDLLmGUFoaclmPRFAVtz4DHHvGJBHg8KNp1eLE8HxxtWbxiuEbMVG3S
 fWcoyREj0h51zfjmEWYjpRed+9S3z5K0z29dG6V/UuizmgsKrpQBAYCSMSM/ttfc9Wl1
 zgKNI/2ccSvwivKRzz8BpYXHztrTzt3YIBqADf4v65nC8AeVDAEnyvdvzXihPKGxl2YA
 3ngis8vN9AtIZ9uSoy342nVNw/wDxQ69FxPY82+F8HjeznNN9/Qcl9EQ7qjZG80ksAO7
 dItze1wXDDHHbqT64QpBOusvmTKdZ7S+uKCsiaZaWLZJVrE49B7nZ1mXWX5oOCX5GY8v
 VhTw==
X-Gm-Message-State: AOJu0Yz8rcj6K76JQHhsGxcfjU4+cNiy0dEr8FTvO868AnsAI0625jCH
 uvUKwcSpRXaZJmractggoX0Rgx8SGdyzf5548M6mEgGRJT+SaC86PbDd
X-Gm-Gg: AZuq6aLw74v8lNGCMHLSIBYyfGk2VEv0OAj/1P2M46Zge2GduuUSPnqV+WL4IhwEyMH
 J0FDEqImUyG6Vx8FTpnQ8As3+8XMDGtJDei0soHlXFsFrKJNTycMmv6YXvc3IRmE9851EZI8i6q
 seiQsirIy4pSA16a+4Bh/oHl+1Cwkip2M7VGlN9ekjDrTyqr92ooKTK4yFa83j0WbP8SWUYXqgv
 IhOEo512LDGa+Yvz/G3Seuj6xL1Qg9YiniqY1vAYhH9Vr6XXuuZlj37pC3la2aclOo7/pY9A+e8
 Srnpgp9Y/X5f7JkNeEzWrR94NKn/nHA12+n92auxsNtmPzSNrkXBqA2rYuy/J9uzREeGxI5RzKp
 rOfdZvFRewVsPOSK/j+UB11QcWNXINjb+BS+aUVRVyrbKaOIdg8tMPmwMUGevuQjZ8DEJp2LZnv
 oFUpneLOAABroSu9e1ZXk=
X-Received: by 2002:a05:600c:45cb:b0:477:8985:4036 with SMTP id
 5b1f17b1804b1-483201dd216mr8628225e9.1.1770321534470; 
 Thu, 05 Feb 2026 11:58:54 -0800 (PST)
Received: from thinkpad-t470s.. ([93.140.16.93])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-436297450b4sm514079f8f.34.2026.02.05.11.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 11:58:53 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 francisco.iglesias@amd.com, Ruslan_Ruslichenko@epam.com,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH 08/29] hw/core: Setup Remote Port I/O channels
Date: Thu,  5 Feb 2026 20:58:03 +0100
Message-ID: <20260205195824.2610192-9-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205195824.2610192-1-ruslichenko.r@gmail.com>
References: <20260205195824.2610192-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Add initialization of communication channels with
remote peer.

This includes character device backend, which can be
configured based on QOM properties or automatic socket
creation based on the machine path. The patch also
initializes the signaling event pipes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Signed-off-by: Takahiro Nakata <takahiro.nakata.wr@renesas.com>
Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/remote-port.c         | 187 ++++++++++++++++++++++++++++++++++
 include/hw/core/remote-port.h |  16 +++
 2 files changed, 203 insertions(+)

diff --git a/hw/core/remote-port.c b/hw/core/remote-port.c
index c909a825f3..5154c1bc2a 100644
--- a/hw/core/remote-port.c
+++ b/hw/core/remote-port.c
@@ -52,6 +52,58 @@
 #define REMOTE_PORT_CLASS(klass)    \
      OBJECT_CLASS_CHECK(RemotePortClass, (klass), TYPE_REMOTE_PORT)
 
+static char *rp_sanitize_prefix(RemotePort *s)
+{
+    char *sanitized_name;
+    char *c;
+
+    sanitized_name = g_strdup(s->prefix);
+    for (c = sanitized_name; *c != '\0'; c++) {
+        if (*c == '/') {
+            *c = '_';
+        }
+    }
+    return sanitized_name;
+}
+
+static char *rp_autocreate_chardesc(RemotePort *s, bool server)
+{
+    char *prefix;
+    char *chardesc;
+    int r;
+
+    prefix = rp_sanitize_prefix(s);
+    r = asprintf(&chardesc, "unix:%s/qemu-rport-%s%s",
+                 machine_path, prefix, server ? ",wait,server" : "");
+    assert(r > 0);
+    free(prefix);
+    return chardesc;
+}
+
+static Chardev *rp_autocreate_chardev(RemotePort *s, char *name)
+{
+    Chardev *chr = NULL;
+    char *chardesc;
+    char *s_path;
+    int r;
+
+    r = asprintf(&s_path, "%s/qemu-rport-%s", machine_path,
+                 rp_sanitize_prefix(s));
+    assert(r > 0);
+    if (g_file_test(s_path, G_FILE_TEST_EXISTS)) {
+        chardesc = rp_autocreate_chardesc(s, false);
+        chr = qemu_chr_new_noreplay(name, chardesc, false, NULL);
+        free(chardesc);
+    }
+    free(s_path);
+
+    if (!chr) {
+        chardesc = rp_autocreate_chardesc(s, true);
+        chr = qemu_chr_new_noreplay(name, chardesc, false, NULL);
+        free(chardesc);
+    }
+    return chr;
+}
 
 static void rp_reset(DeviceState *dev)
 {
@@ -66,6 +118,127 @@ static void rp_reset(DeviceState *dev)
 
 static void rp_realize(DeviceState *dev, Error **errp)
 {
+    RemotePort *s = REMOTE_PORT(dev);
+    int r;
+    Error *err = NULL;
+
+    s->prefix = object_get_canonical_path(OBJECT(dev));
+
+    if (!qemu_chr_fe_get_driver(&s->chr)) {
+        char *name;
+        Chardev *chr = NULL;
+        static int nr;
+
+        r = asprintf(&name, "rport%d", nr);
+        nr++;
+        assert(r > 0);
+
+        if (s->chrdev_id) {
+            chr = qemu_chr_find(s->chrdev_id);
+        }
+
+        if (chr) {
+            /* Found the chardev via commandline */
+        } else if (s->chardesc) {
+            chr = qemu_chr_new(name, s->chardesc, NULL);
+        } else {
+            if (!machine_path) {
+                error_report("%s: Missing chardesc prop."
+                             " Forgot -machine-path?",
+                             s->prefix);
+                exit(EXIT_FAILURE);
+            }
+            chr = rp_autocreate_chardev(s, name);
+        }
+
+        free(name);
+        if (!chr) {
+            error_report("%s: Unable to create remort-port channel %s",
+                         s->prefix, s->chardesc);
+            exit(EXIT_FAILURE);
+        }
+
+        qdev_prop_set_chr(dev, "chardev", chr);
+        s->chrdev = chr;
+    }
+
+#ifdef _WIN32
+    /*
+     * Create a socket connection between two sockets. We auto-bind
+     * and read out the port selected by the kernel.
+     */
+    {
+        char *name;
+        SocketAddress *sock;
+        int port;
+        int listen_sk;
+
+        sock = socket_parse("127.0.0.1:0", &error_abort);
+        listen_sk = socket_listen(sock, 1, &error_abort);
+
+        if (s->event.pipe.read < 0) {
+            perror("socket read");
+            exit(EXIT_FAILURE);
+        }
+
+        {
+            struct sockaddr_in saddr;
+            socklen_t slen = sizeof saddr;
+            int r;
+
+            r = getsockname(listen_sk, (struct sockaddr *) &saddr, &slen);
+            if (r < 0) {
+                perror("getsockname");
+                exit(EXIT_FAILURE);
+            }
+            port = htons(saddr.sin_port);
+        }
+
+        name = g_strdup_printf("127.0.0.1:%d", port);
+        s->event.pipe.write = inet_connect(name, &error_abort);
+        g_free(name);
+        if (s->event.pipe.write < 0) {
+            perror("socket write");
+            exit(EXIT_FAILURE);
+        }
+
+        for (;;) {
+            struct sockaddr_in saddr;
+            socklen_t slen = sizeof saddr;
+            int fd;
+
+            slen = sizeof(saddr);
+            fd = qemu_accept(listen_sk, (struct sockaddr *)&saddr, &slen);
+            if (fd < 0 && errno != EINTR) {
+                close(listen_sk);
+                return;
+            } else if (fd >= 0) {
+                close(listen_sk);
+                s->event.pipe.read = fd;
+                break;
+            }
+        }
+
+        if (!qemu_set_blocking(s->event.pipe.read, false, &err)) {
+            error_report("%s: Unable to set non-block for internal pipes",
+                        s->prefix);
+            exit(EXIT_FAILURE);
+        }
+    }
+#else
+    if (!g_unix_open_pipe(s->event.pipes, FD_CLOEXEC, NULL)) {
+        error_report("%s: Unable to create remort-port internal pipes",
+                    s->prefix);
+        exit(EXIT_FAILURE);
+    }
+
+    if (!qemu_set_blocking(s->event.pipe.read, false, &err)) {
+        error_report("%s: Unable to set non-block for internal pipes",
+                    s->prefix);
+        exit(EXIT_FAILURE);
+    }
+
+#endif
 }
 
 static void rp_unrealize(DeviceState *dev)
@@ -73,6 +246,13 @@ static void rp_unrealize(DeviceState *dev)
     RemotePort *s = REMOTE_PORT(dev);
 
     s->finalizing = true;
+
+    info_report("%s: Wait for remote-port to disconnect", s->prefix);
+    qemu_chr_fe_disconnect(&s->chr);
+
+    close(s->event.pipe.read);
+    close(s->event.pipe.write);
+    object_unparent(OBJECT(s->chrdev));
 }
 
 static const VMStateDescription vmstate_rp = {
@@ -84,6 +264,12 @@ static const VMStateDescription vmstate_rp = {
     }
 };
 
+static Property rp_properties[] = {
+    DEFINE_PROP_CHR("chardev", RemotePort, chr),
+    DEFINE_PROP_STRING("chardesc", RemotePort, chardesc),
+    DEFINE_PROP_STRING("chrdev-id", RemotePort, chrdev_id),
+};
+
 static void rp_prop_allow_set_link(const Object *obj, const char *name,
                                    Object *val, Error **errp)
 {
@@ -112,6 +298,7 @@ static void rp_class_init(ObjectClass *klass, const void *data)
     dc->realize = rp_realize;
     dc->unrealize = rp_unrealize;
     dc->vmsd = &vmstate_rp;
+    device_class_set_props_n(dc, rp_properties, ARRAY_SIZE(rp_properties));
 }
 
 static const TypeInfo rp_info = {
diff --git a/include/hw/core/remote-port.h b/include/hw/core/remote-port.h
index db71071c8e..0f40018cdb 100644
--- a/include/hw/core/remote-port.h
+++ b/include/hw/core/remote-port.h
@@ -56,8 +56,24 @@ typedef struct RemotePortDeviceClass {
 struct RemotePort {
     DeviceState parent;
 
+    union {
+       int pipes[2];
+       struct {
+           int read;
+           int write;
+       } pipe;
+    } event;
+    Chardev *chrdev;
+    CharFrontend chr;
     bool finalizing;
 
+    char *chardesc;
+    char *chrdev_id;
+
+    const char *prefix;
+    const char *remote_prefix;
+
+    uint32_t current_id;
     bool reset_done;
 
 #define REMOTE_PORT_MAX_DEVS 1024
-- 
2.43.0


