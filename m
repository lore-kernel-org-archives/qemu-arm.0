Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1300419ejb;
        Thu, 3 Aug 2023 13:48:39 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGg6K8lLxh5CyBAqK3JPrsAhSox80JkEV9dd6Ky96kAKxlNYP3W2N/XG4flNg9VLUHrDG09
X-Received: by 2002:a9d:7355:0:b0:6bc:c541:e4d0 with SMTP id l21-20020a9d7355000000b006bcc541e4d0mr3525492otk.14.1691095718833;
        Thu, 03 Aug 2023 13:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691095718; cv=none;
        d=google.com; s=arc-20160816;
        b=xQF7/0X5+20jm9kI/EPqWkcCzSn0Nvl+0CZ6NDFfRLBQrEQnGzBCHXLMcJobUtBZQv
         RUqiX63wu7kpgSi7Lcx1gTMaQFfgeDKQz7/yR51W0gRmxDhqFq3m60rLS5nAcK96zr+g
         F69xB/7yW8Z6GqoVSYSTgj5oVzSbBSJcKW1AHF2r/X3PKZsTx+L4qEmjJ+IemOeBfGSm
         Q9gFVGjU63fmZs68YClO+cW1qaLSNKrmAFXujGP4LWsxvoVapvDm4zvUpcF3k7Snsxsf
         x/u8q2R5z8LK7lVeWkSO885+4sv6H9b90OD1srB2TsoJlIkP5bK54kBziBmrrh+kWy4r
         d3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:ui-outboundreport
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gNtYkp7dJPSDho2hvtZ8ViVnH2pbfFimINNw+qCvFEA=;
        fh=KcCm1zpkZGHqK56CXSJiR4VdUGdqN0fMaejc8m/ThPI=;
        b=XSqLLnVMDbdxSLDNbYZHBQ4CojgEylbjMZhbY94Tp3aMpy9FXTmyu/oWYmcghxC376
         hBgWE1aRkDY3j9ac073Ur/keM0sYaphMAfShxpgErV0dNHH7gc3NnTwk/+CSZ7O2YTnZ
         LFtLfjlYQPXTWgx5qKtp386kSddMJgR/xS8cVp5KY8HkI9B3/ZO8KnfCdSHERPkgnfMd
         0ycctXpiQxnNzc5+/lOfywLa/tj12EvTeYfVX9kpHQoWuxKJPOSg8ZbbEIq1znNL+FS3
         YvFSM9pqCjQ5F4iLZGNPpZ42zhKN/8Jmx+EH37BEBjvgFjmtNqLSrEeCRoxOjF2ehiNu
         +lfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=McgcxK26;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13-20020ac87fcd000000b0040fe7e0959esi326276qtk.602.2023.08.03.13.48.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Aug 2023 13:48:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=McgcxK26;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qRfF5-0007em-Rx; Thu, 03 Aug 2023 16:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1qRfF4-0007YX-5m; Thu, 03 Aug 2023 16:48:18 -0400
Received: from mout.gmx.net ([212.227.17.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1qRfF2-0002UP-F1; Thu, 03 Aug 2023 16:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1691095685; x=1691700485; i=deller@gmx.de;
 bh=lhYljpfvW3kbrbZFdXLNDwXWVsR5BLVObZ2qG3ggGF4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=McgcxK26LWYz0iO6ABI3xRtvcShZAPTMuxNkxCuuAspiHUAhZI7yeeV2SFm7RGn+TJUgyuZ
 BId+DBGH3iB2UctiHDlErgbk0jhF0VguOsjL18HcD41L9Q9zWak5kuLiULE2faVs7j6/j5l0n
 IaDkc32KfHr0DmaTUCfA2nhoze7PD/O1GDSm44hs/QRYfvRFw93yH0jFUSve80SDQNt11SgTb
 YIbExHPBCDyvoZC5TE7+CFaUCJtAV71Ujlpp5X1tbJc0u9IY+muL6MNY53awK29y0nj0QIXKq
 AQDCVUtBjNkyHMZSpFFdqWhOuEMRwsUppL1ra7LpojkxeUK83x4g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([94.134.147.53]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9Mtg-1pnC7641jg-015Jl7; Thu, 03
 Aug 2023 22:48:05 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Michael Cree <mcree@orcon.net.nz>
Subject: [PATCH v3 3/3] linux-user: Emulate /proc/cpuinfo for Alpha
Date: Thu,  3 Aug 2023 22:48:03 +0200
Message-ID: <20230803204803.639733-4-deller@gmx.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803204803.639733-1-deller@gmx.de>
References: <20230803204803.639733-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:obfIfNRsORslnLIr1qrPWGHFWRiPb/NcfzczxGgi/EetgjPsNiy
 XnCunUwRQ0gjeOZ4PT0q/7gNC5hPoEvhfY67Jj+UIKUQI38xB6k0jGA+p4YnSFiR+1+ri0C
 YyxloKeCVUyEcc6Dk5w5zVj8Ij3WNE6XN5aKurGz1VG5hrUShJJTqnG8RWnW9xqsSE6A9vF
 lIhSmtw8nDeTOpFi8Fj2g==
UI-OutboundReport: notjunk:1;M01:P0:f5sXkuxRrFc=;o/4H8SO2nFBBcTJlH9z+hiVv78P
 Uz51bgPqDhAYliMStQvQ7WzLzBJbv/AJywD9gjniWIzDH6eAPBpE2Y7+XFYho6pE5SJT4qaQR
 +ZKFfVE2v6BSaK+2R51aXeWDKLoZrDOF58Tvtg+2iWb4t+uDjplYA0ZfG6elxF9LD/jzmrccL
 7obr9pC0BuyCIKcAZYMlI5EXi7Yjw93kOY3dsaI0TFCr3OPeLAKPLNN2/AeC9apFncirt6Bvo
 BkwvnS/b88mfEf56E4uzXFo0Rn96/3IgxQTfth0JDPB++FEqHVoJzR9S9MkfDu1qAJXg75xSA
 4K+YIXKEcpEXVfnGdZcGQU240kMyUgZiwYVvUlUlSJuUaVX2H/2wgywNo4ix0xzi/YF7XQcfb
 TKW94HkqZZtxgKm93M7JPDveeDwRd+Qs2Ulc4FPb7H1q84xYwJSScYtBbp8yGVBG41o84ofgZ
 CKKQFfmwLjExeo1/djnwgJX6gg2soXh9P1iyF7wnIKGSDvd0dIAKLBcQ2EEuowShOiAW3PgEC
 NIW5cYvQJJEKGEwC47JumaIkWW6vTKfQ8P34JmJHOHuysNWd2C1SOIDT46UgLW65NQ8MNbJaN
 fqcedhifKYJbAhWEkXsgFrOEtDnYAq2StFmeCNJbekn59EHcuUPiChLXpFeozKBOt45VworQr
 riWKG+P4IjFq87C4nz3MfGlyOQlIBj2fa3BLjj0ax4XplJ7EHPAGQKvT3pUAxS8Ozr3Le4cxI
 bxRt62NBlHhayhGnFL/qb6oyTsxiGLsiv7KCgxUp+E03oAU8y+i8N12wkxwhaGB4UgeN+IC5a
 1FfYzl6VFx7o8ofqSk56wFzQhq8z62iVGrfKCtSii0QDfUBfQMtztRkLAF6fZEMuJpHXUwWqi
 MeePyHZRmF9hjOz16IpOREvYvgyqLHCahDNsq1m+ArxzrrKTbZOt4BnecjTfaM7f1z+LN0orK
 7vfGrxgccZOr4B+yJf+4gs+5bTw=
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eCQCpq0mTJNo

Add emulation for /proc/cpuinfo for the alpha architecture.

alpha output example:

(alpha-chroot)root@p100:/# cat /proc/cpuinfo
cpu                     : Alpha
cpu model               : ev67
cpu variation           : 7
cpu revision            : 0
cpu serial number       : JA00000000
system type             : QEMU
system variation        : QEMU_v8.0.92
system revision         : 0
system serial number    : AY00000000
cycle frequency [Hz]    : 250000000
timer frequency [Hz]    : 250.00
page size [bytes]       : 8192
phys. address bits      : 44
max. addr. space #      : 255
BogoMIPS                : 2500.00
platform string         : AlphaServer QEMU user-mode VM
cpus detected           : 8
cpus active             : 4
cpu active mask         : 0000000000000095
L1 Icache               : n/a
L1 Dcache               : n/a
L2 cache                : n/a
L3 cache                : n/a

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: Michael Cree <mcree@orcon.net.nz>

v2:
- revised platform string and system variation output
- show cpus detected/active/active mask based on
  current physical machine configuration
=2D--
 linux-user/syscall.c | 56 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index bac764f502..a4d597ac05 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8324,7 +8324,7 @@ void target_exception_dump(CPUArchState *env, const =
char *fmt, int code)
 #if HOST_BIG_ENDIAN !=3D TARGET_BIG_ENDIAN || \
     defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)=
 || \
     defined(TARGET_RISCV) || defined(TARGET_S390X) || defined(TARGET_ARM)=
 || \
-    defined(TARGET_AARCH64)
+    defined(TARGET_AARCH64) || defined(TARGET_ALPHA)
 static int is_proc(const char *filename, const char *entry)
 {
     return strcmp(filename, entry) =3D=3D 0;
@@ -8376,6 +8376,57 @@ static int open_net_route(CPUArchState *cpu_env, in=
t fd)
 }
 #endif

+#if defined(TARGET_ALPHA)
+static int open_cpuinfo(CPUArchState *cpu_env, int fd)
+{
+    int max_cpus =3D sysconf(_SC_NPROCESSORS_CONF);
+    int num_cpus =3D sysconf(_SC_NPROCESSORS_ONLN);
+    uint64_t cpu_mask;
+    char model[32];
+    char *p;
+    AlphaCPU *cpu =3D env_archcpu(cpu_env);
+    CPUAlphaState *env =3D &cpu->env;
+
+    g_strlcpy(model, object_class_get_name(
+                        OBJECT_CLASS(CPU_GET_CLASS(env_cpu(cpu_env)))),
+              sizeof(model));
+    p =3D strchr(model, '-');
+    if (p) {
+        *p =3D '\0';
+    }
+    if (sched_getaffinity(getpid(), sizeof(cpu_mask),
+                          (cpu_set_t *) &cpu_mask) < 0) {
+        cpu_mask =3D (1ULL << num_cpus) - 1;
+    }
+
+    dprintf(fd, "cpu\t\t\t: Alpha\n");
+    dprintf(fd, "cpu model\t\t: %s\n", model);
+    dprintf(fd, "cpu variation\t\t: %d\n", env->implver + 5);
+    dprintf(fd, "cpu revision\t\t: 0\n");
+    dprintf(fd, "cpu serial number\t: JA00000000\n");
+    dprintf(fd, "system type\t\t: QEMU\n");
+    dprintf(fd, "system variation\t: QEMU_v%s\n", QEMU_VERSION);
+    dprintf(fd, "system revision\t\t: 0\n");
+    dprintf(fd, "system serial number\t: AY00000000\n");
+    dprintf(fd, "cycle frequency [Hz]\t: 250000000\n");
+    dprintf(fd, "timer frequency [Hz]\t: 250.00\n");
+    dprintf(fd, "page size [bytes]\t: %d\n", TARGET_PAGE_SIZE);
+    dprintf(fd, "phys. address bits\t: %d\n", TARGET_PHYS_ADDR_SPACE_BITS=
);
+    dprintf(fd, "max. addr. space #\t: 255\n");
+    dprintf(fd, "BogoMIPS\t\t: 2500.00\n");
+    dprintf(fd, "platform string\t\t: AlphaServer QEMU user-mode VM\n");
+    dprintf(fd, "cpus detected\t\t: %d\n", max_cpus);
+    dprintf(fd, "cpus active\t\t: %d\n", num_cpus);
+    dprintf(fd, "cpu active mask\t\t: %016llx\n", (unsigned long long) cp=
u_mask);
+    dprintf(fd, "L1 Icache\t\t: n/a\n");
+    dprintf(fd, "L1 Dcache\t\t: n/a\n");
+    dprintf(fd, "L2 cache\t\t: n/a\n");
+    dprintf(fd, "L3 cache\t\t: n/a\n");
+    return 0;
+}
+#endif
+
+
 #if defined(TARGET_SPARC)
 static int open_cpuinfo(CPUArchState *cpu_env, int fd)
 {
@@ -8633,7 +8684,8 @@ int do_guest_openat(CPUArchState *cpu_env, int dirfd=
, const char *fname,
 #endif
 #if defined(TARGET_SPARC) || defined(TARGET_HPPA) || \
     defined(TARGET_RISCV) || defined(TARGET_S390X) || \
-    defined(TARGET_ARM)   || defined(TARGET_AARCH64)
+    defined(TARGET_ARM)   || defined(TARGET_AARCH64) || \
+    defined(TARGET_ALPHA)
         { "/proc/cpuinfo", open_cpuinfo, is_proc },
 #endif
 #if defined(TARGET_M68K)
=2D-
2.41.0

