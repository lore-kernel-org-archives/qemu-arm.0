Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1625343lff;
        Wed, 8 Jan 2020 20:13:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqxTpjjyTyVm4Uabv8p+R2xEQoj7Xf7gY4N/nb1yGWnNiPcBpnYBEwppe8NVz6BWNx8bloX0
X-Received: by 2002:a50:fd15:: with SMTP id i21mr9020416eds.91.1578543214300;
        Wed, 08 Jan 2020 20:13:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578543214; cv=none;
        d=google.com; s=arc-20160816;
        b=XX6bg0CGXtaOopRvdnaPFcdiw9UP17bNsXV3tU9JU5/i2b0eevC45es2erG7MtlEG/
         FwXf5qkBiI8b/taWOBGZ9ar+tP1CI+yRkMLDXNCX93qRflM2tGOqq1OtSEURSi4or8A7
         bjlrBDScXrR5ffJSprSUn1F3wdTbofQjSPAggI3jfd/vvxyA/05eUckEVouCd5meki7H
         QfaXJ0fP4suFLjg4eiXh8O+EWgl6jsvpooRzSeD3/l9LxoGIwiIuukJfTswXyqpCfP+L
         ILc7sgGkkCbdwHx0+R+MuGyAuYjzDKuvtKbn6nd9VNg+BjqfQ39oXGTLe56UPdDuH7St
         iqEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature:dkim-filter;
        bh=BGrV9MYFYy/4lN3+lwdtOSdl3h0m0Dt37S+FF37WHQc=;
        b=wfKIzt2nYjUcQpGKiN/4LItAL48TiMLKXI1JkKrxPmjPnzfUoxM5rQgams0yJ9KiEE
         JBjRcHCcJZl0yrFsjVo33CdteV/19isuPJWS6BAaTDjUFh1jO4UFklXVcO25tVrZ4TcD
         BedHQSjkpxVFK0WbluyrhaoCcXT+0vdrAx3BAIXLbjZFjwZMNX0dEWkbdqgkX5J2GmjF
         hYLgFrFfTIQebTq0CR8x2FLcGqflzmkznmvHHq5CHclZ2ldhMb43NcPFS8UuNrfwPNmt
         zjlY6VRNRVAAetXZreL7ssHtUmyRH2snKDlAy6TFyxNm1K0za81gzinLpIY44WpUla/c
         5GyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nifty.com header.s=dec2015msa header.b="d/T0X+ZA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15si3589414ejz.397.2020.01.08.20.13.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2020 20:13:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nifty.com header.s=dec2015msa header.b="d/T0X+ZA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:55002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipPCO-0006LX-Nj
	for alex.bennee@linaro.org; Wed, 08 Jan 2020 23:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32811)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <masahiroy@kernel.org>) id 1ipPCB-0006LF-RQ
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 23:13:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <masahiroy@kernel.org>) id 1ipPC9-0002T4-V9
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 23:13:19 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:62838)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <masahiroy@kernel.org>)
 id 1ipPC8-0002Hs-Fh; Wed, 08 Jan 2020 23:13:17 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-08.nifty.com with ESMTP id 0094CUwT026552;
 Thu, 9 Jan 2020 13:12:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 0094CUwT026552
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1578543151;
 bh=BGrV9MYFYy/4lN3+lwdtOSdl3h0m0Dt37S+FF37WHQc=;
 h=From:To:Cc:Subject:Date:From;
 b=d/T0X+ZAfspEWoIVTg6beDtFsXcpo+8TfB2VkYDfVX2fDsjd0JLe106hkZ5zWkD+w
 IbMy5mC2H5icC68IkVKkkOYtG5BHN0x4RDr04zeM4cRbM4x3exNGenvNHRp/0/Hedo
 OamRG1eZ5De043p7uTnTt3/Hau25+r4DykuhViQV1UCWDrX/WhV1oO0v+6Lwc8fa09
 DaT+Weq8Rj5RIQU9LWuytgEkytPOorJlh38SaODizyH/IBRioIwa+Jd5Np1BGLLDIj
 rAgRCfNbx/Vlx6lZKsGw+sLx5zzyVel2vrIMHbdr8oU/DPKp61s5y2OZSflbl+EQE9
 swYZzQpIuDNig==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <masahiroy@kernel.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] target/arm/arm-semi: fix SYS_OPEN to return nonzero filehandle
Date: Thu,  9 Jan 2020 13:12:28 +0900
Message-Id: <20200109041228.10131-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 210.131.2.75
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Masahiro Yamada <masahiroy@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tG03cxmNr1IC

According to the specification "Semihosting for AArch32 and Aarch64",
the SYS_OPEN operation should return:

 - A nonzero handle if the call is successful
 - -1 if the call is not successful

So, it should never return 0.

Prior to commit 35e9a0a8ce4b ("target/arm/arm-semi: Make semihosting
code hand out its own file descriptors"), the guest fd matched to the
host fd. It returned a nonzero handle on success since the fd 0 is
already used for stdin.

Now that the guest fd is the index of guestfd_array, it starts from 0.

I noticed this issue particularly because Trusted Firmware-A built with
PLAT=qemu is no longer working. Its io_semihosting driver only handles
a positive return value as a valid filehandle.

Basically, there are two ways to fix this:

  - Use (guestfd - 1) as the index of guestfs_arrary. We need to insert
    increment/decrement to convert the guestfd and the array index back
    and forth.

  - Keep using guestfd as the index of guestfs_array. The first entry
    of guestfs_array is left unused.

I thought the latter is simpler. We end up with wasting a small piece
of memory for the unused first entry of guestfd_array, but this is
probably not a big deal.

Fixes: 35e9a0a8ce4b ("target/arm/arm-semi: Make semihosting code hand out its own file descriptors")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 target/arm/arm-semi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 6f7b6d801bf9..4275dfc34591 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -144,7 +144,8 @@ static int alloc_guestfd(void)
         guestfd_array = g_array_new(FALSE, TRUE, sizeof(GuestFD));
     }
 
-    for (i = 0; i < guestfd_array->len; i++) {
+    /* SYS_OPEN should return nonzero handle on success. Start guestfd from 1 */
+    for (i = 1; i < guestfd_array->len; i++) {
         GuestFD *gf = &g_array_index(guestfd_array, GuestFD, i);
 
         if (gf->type == GuestFDUnused) {
@@ -168,7 +169,7 @@ static GuestFD *do_get_guestfd(int guestfd)
         return NULL;
     }
 
-    if (guestfd < 0 || guestfd >= guestfd_array->len) {
+    if (guestfd <= 0 || guestfd >= guestfd_array->len) {
         return NULL;
     }
 
-- 
2.17.1

