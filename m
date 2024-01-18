Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp228666ejg;
        Thu, 18 Jan 2024 04:20:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjtP0E5eTKbEtz7AD/MoecclGhsgVe1XCPEdZ1iHrHs5/j2v66mjJXceHaQmGaQQBQb2M7
X-Received: by 2002:a25:dc93:0:b0:dbd:13cb:fdce with SMTP id y141-20020a25dc93000000b00dbd13cbfdcemr602356ybe.33.1705580437715;
        Thu, 18 Jan 2024 04:20:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705580437; cv=none;
        d=google.com; s=arc-20160816;
        b=wFcWA8r8ZHw4R/ekT9CZSH38okZWH/k08/JK8D17XtOUOoRqaxr+GX4Lq/ZtSHPXkC
         jSxuzJ6x2YaY8dyGFVNgDVUKh4oLt6KSVyAWG49DVo7Ff89F2Scp33R19vTxrRTNExTR
         hCPoDedl8hQRvk+mqhqhyUg9UvrlCJyxeMR149OxtbjA3DKRchMeJcIGdaLHc0wo1FTS
         Mh/dlzBOinfw/h4cACk5xLJtl0k70VofZmV4iOKanhocs21LDHtAHKsCwpEfHuSy0n9c
         OO5a8ccKM26TpPgNDHiGtHM4ra1FQcOxKdnCETBAKueB2eB9C6DXHO9jK5tVCocEDmKz
         m4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tBFgAn6mLSL6Er50PQl4EyEf/G+pXg6i15jyXgl3RBA=;
        fh=okBdXp2j7ZzUTSUTpGCvfl98J3L9zXWlzkZsOlQF4t8=;
        b=0qNqzdC32DbWetvXUiP57JH+e8OQCPZ4Fbze+zzL3s5vxybWuBOewuaryg73yLT2KT
         VogDC3y9ZzANTGD9i9jZiuarvk84yqFn1Y2OZnQkTINJfPp23FsWRMHMc5qQy5NsdnBD
         Iq7P7Cb0dJDgb3awbI7wVIHTLZzxqm+RhFezPk2dk4whRxezpMYk8SoSpWY62ObXh5uV
         AeVxbXqoBETewVOVKSHZEcLPRIAMiF/VUZHfr0teoRK4+5EQLJ7N6Xie3b/h+WD227/H
         k97Q9Ce6xIdAt8LdLLAsP/+U2k/hwTxJ+CeN1GjzSkuvjkkY794Jenu63t1OSt9NNE3s
         AjjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wdflkbO6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4-20020a0c9c04000000b0068028d3a037si13908876qve.154.2024.01.18.04.20.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jan 2024 04:20:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wdflkbO6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQRNh-0000fA-1L; Thu, 18 Jan 2024 07:20:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rQRNc-0000eK-7P
 for qemu-arm@nongnu.org; Thu, 18 Jan 2024 07:20:20 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rQRNZ-0003OY-SE
 for qemu-arm@nongnu.org; Thu, 18 Jan 2024 07:20:19 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a2e0be86878so128073866b.1
 for <qemu-arm@nongnu.org>; Thu, 18 Jan 2024 04:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705580416; x=1706185216; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tBFgAn6mLSL6Er50PQl4EyEf/G+pXg6i15jyXgl3RBA=;
 b=wdflkbO67S0hJp8S1PSdvexopDRqkeocNCXdJOrO43+2E+45FPKpa15wgcteRAnnBl
 NoIEWT9bYp2OdBcO5UhVhvnVHrmZck2E0cOeAA5ISnYaxE/fGMzyQE1uUOvDDOmXQHje
 fMj8TKh1g8dIXq/PPzjlIH+VVkQT9BfhVvZkLuf9vHywkgHKMc31c9qXkOhfCuuQy7Ez
 N3KoDpANy83j4nCHnAYHZtCs7UIJ9BSW7E+zx8Y/apCQab3yFmOXUIvF5XDc0m+9DjM0
 Xa1apJLknyStYq2sFdupzrlhstmnOV4vqBObDnoLxG5LoBhQFM1GcWX72ZHHOVrTbD8w
 Ww8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705580416; x=1706185216;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tBFgAn6mLSL6Er50PQl4EyEf/G+pXg6i15jyXgl3RBA=;
 b=SrhHwxvzfn8uv/fcCZT5SuM9Z9wcIsbzJCT3zBRGMA3diLaFwcR5zveas3dZIPB8rQ
 n4vdoT663w9P6xmQu8VBN+Gh3FyYYwi666wHWy0AaQr8I0d50Hp89ZvwE8+hOF/sGChp
 Wk+O9SurH1zI5GgK+DQGgHuzlwpy25YSMGa8bFel/L35TPaP4U33iAEdIgqyJZMKZSdG
 sZZgqbI0gkOOMVfCe//ddx0DeVgWlEQvMvxJzXYcA1v4A3M3O4YfCulCy4w1KSJYX8Yl
 7KBLZat/i/nps3zHDO1ikpPJ2nWBXGOk2S1ZqCVTDH6dQlHAqT2quthBHpWPwbsSwhw6
 LKtg==
X-Gm-Message-State: AOJu0YxNrUJLA903MvglNE8wpSY5E1fWH+Neu+Q4tJwldUiNpC12UYHI
 dpwq1DxlqHNykpVCmW4yVXJef3Cyxjhd7Glu0npLKsKChtSyHjVDng6pczjVK2VLPDw7l07rwjZ
 7iCNAOJOhqcBEeW5gevY6p2DfBSUx+dr6tvnaXg==
X-Received: by 2002:a17:906:5a:b0:a2c:cdef:b03c with SMTP id
 26-20020a170906005a00b00a2ccdefb03cmr2475748ejg.30.1705580415861; Thu, 18 Jan
 2024 04:20:15 -0800 (PST)
MIME-Version: 1.0
References: <20240110234232.4116804-1-nabihestefan@google.com>
 <CAFEAcA-2U=8nQH85tQQOPebDbpWuxsQ9_XdSSbiaR1Z8oNZ3PQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-2U=8nQH85tQQOPebDbpWuxsQ9_XdSSbiaR1Z8oNZ3PQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jan 2024 12:20:04 +0000
Message-ID: <CAFEAcA_PpvrrsZa53QoaPq3tyi6yUh1y-1p5Kw0Fx_dQN+RNiQ@mail.gmail.com>
Subject: Re: [PATCH v12 00/10] Implementation of NPI Mailbox and GMAC
 Networking Module
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 9529e5wykjJ/

On Sat, 13 Jan 2024 at 12:27, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 10 Jan 2024 at 23:42, Nabih Estefan <nabihestefan@google.com> wrote:
> >
> > From: Nabih Estefan Diaz <nabihestefan@google.com>
> >
> > [Changes since v11]
> > Was running into error syncing into master. It seemed to be related to a
> > hash problem introduced in patchset 10 (unrelated to the macOS build
> > issue). carried the patches from v9 (before the syncing problem) and
> > added the fixes from patchsets 10 and 11 to remove the hash error.
> >
>
> I found some more issues with this which I've noted in the
> individual patches: in particular the patchset is supposed
> to compile after every patch, and to get that to happen
> a few sections of code needed to be in different patches.
> There were also a couple of other niggles.
>
> However, since the fixes were minor, I have made them myself
> in applying this series to target-arm.next, to save you having
> to do yet another respin.

It turns out that the tests don't pass on a big-endian host.

Some of this is just bugs in the test case code, like this,
where the protocol between the device and the chardev
expects the offset in little-endian byte order but the
test case was not ensuring that:

diff --git a/tests/qtest/npcm7xx_pci_mbox-test.c
b/tests/qtest/npcm7xx_pci_mbox-test.c
index 341642e6371..d1714f44517 100644
--- a/tests/qtest/npcm7xx_pci_mbox-test.c
+++ b/tests/qtest/npcm7xx_pci_mbox-test.c
@@ -101,6 +101,7 @@ static void receive_data(uint64_t offset, uint8_t
*buf, size_t len)
     ssize_t rv;

     while (len > 0) {
+        uint8_t offset_bytes[8];
         uint8_t size;

         if (len >= 8) {
@@ -118,7 +119,8 @@ static void receive_data(uint64_t offset, uint8_t
*buf, size_t len)
         rv = write(fd, &op, 1);
         g_assert_cmpint(rv, ==, 1);
         /* Write offset */
-        rv = write(fd, (uint8_t *)&offset, sizeof(uint64_t));
+        stq_le_p(offset_bytes, offset);
+        rv = write(fd, offset_bytes, sizeof(uint64_t));
         g_assert_cmpint(rv, ==, sizeof(uint64_t));
         /* Write size */
         g_assert_cmpint(write(fd, &size, 1), ==, 1);
@@ -141,6 +143,7 @@ static void send_data(uint64_t offset, const
uint8_t *buf, size_t len)

     while (len > 0) {
         uint8_t size;
+        uint8_t offset_bytes[8];

         if (len >= 8) {
             size = 8;
@@ -157,7 +160,8 @@ static void send_data(uint64_t offset, const
uint8_t *buf, size_t len)
         rv = write(fd, &op, 1);
         g_assert_cmpint(rv, ==, 1);
         /* Write offset */
-        rv = write(fd, (uint8_t *)&offset, sizeof(uint64_t));
+        stq_le_p(offset_bytes, offset);
+        rv = write(fd, offset_bytes, sizeof(uint64_t));
         g_assert_cmpint(rv, ==, sizeof(uint64_t));
         /* Write size */
         g_assert_cmpint(write(fd, &size, 1), ==, 1);


(Side note, if you find yourself casting a uint64_t* to
to a uint8_t* this is almost always a sign of endianness
problems. There are similar casts in the device implementation
which are also flags of problems: see below.)

However this isn't sufficient for the test cases to pass,
because the code in the device itself seems to be confused.
For data sent *to* the device, the OP_WRITE code expects
to see the data in little-endian order, which it then
writes to the guest memory as LE. However for data
read *from* the device, npcm7xx_pci_mbox_send_response()
does not do anything about endianness and so the data
is read from the guest memory as LE and then sent out
on the wire in host-endianness order.

Because I don't know what the intention was here I'm not
going to try to fix this up. Please can you have a look
at this? I would also recommend that you write up somewhere
(even if just in a comment) exactly what the protocol
specification for the on-the-wire format is. That will
make it much easier to determine whether a bug is on the
sending side or the receiving side.


For the other minor stuff which I fixed up locally before
sending the pull request: I suggest that you take the
patches as they appeared there, i.e. patches 10..18 from here:
 https://patchew.org/QEMU/20240116151228.2430754-1-peter.maydell@linaro.org/
But I've just noticed that I seem to have messed up the
author state on some of those patches (probably while I
was squashing patches into each other etc) -- please
check through and correct those back to the original
authorship attribution.

thanks
-- PMM
