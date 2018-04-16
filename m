Received: by 10.28.4.212 with SMTP id 203csp2975005wme;
        Mon, 16 Apr 2018 11:47:08 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+qxh9Yqzw9hHMFiCYCB25/Hvs38LvutJ3pS7X+YgVFjSilC4McNoFxTTuDRIwZiu4RMyHq
X-Received: by 10.200.2.165 with SMTP id p37mr11728265qtg.218.1523904428424;
        Mon, 16 Apr 2018 11:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523904428; cv=none;
        d=google.com; s=arc-20160816;
        b=DoOEbFBV8yUHwofM8Df5wnmYpuqnLXj1h0Pg1OCaWR875EuqtchAqYV+n8YK0/Jxn0
         kSxiwi/7ylZ7fRT8GI5NoiT1wlVbVkV6bAPY+DcIVtsLR3WFdelSN2q+Ne0W1XHtZiaH
         dhcF6t2GHZPl5mB759V3xLMEc/5+o+O9ieRxRXI4yPPvJJLYIFTvkCf56ppZqqd4KeEU
         M71VLRAGbCYtdDAbqEwFM+V53HrXY31hWkBGLIb3xQRFDcITXzgdAL9YnTPY/PpA7DAl
         DYFob9/yaUL5CfmrpxfFC3Du8ur17RN4cySPCan50Du6RaY5B0Wn74q5P+EPsWuUpZym
         CWQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=Kxuk3NXuyXoVCdk4KoffP/V5Qmy/mR//WrTNstQMWVU=;
        b=UuPEt5Swi37334e02kQYt0dfdAOP2O2TNzx6jB5/RqTsvzLjrY1/DTw+2h1J+VdDtO
         uqsUL7yzXkeLibxfLYMlt/KU3Fvz8q8pv6L7ba6FwqgSuNfwFqdanwzpGoKSK7ulnhe6
         FV5gvqVSA4oCxk9Ym9md9EYNVXlz7tvo/ZFn7e67AThjtkZzuKsoqbA16oS9zOgTXglB
         qW0NLAds0Wr0avYzAf9eRjQA0aKgs+fNKY3CGNh/5gQb12bX5nAhQSfTIMXmFwhjD3KF
         no/GEwME9RGTvo4VAwJBBoYl6XtqZcxnRYBrrR8KyYoFp3kbHmxs5k4PAxdJjtU2j2hw
         LD5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=Qgn+Twld;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l47si5549415qtk.30.2018.04.16.11.47.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 11:47:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=Qgn+Twld;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36248 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f899f-0003yo-Vz
	for alex.bennee@linaro.org; Mon, 16 Apr 2018 14:47:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hwertz10@gmail.com>) id 1f897b-0002zk-7a
	for qemu-devel@nongnu.org; Mon, 16 Apr 2018 14:45:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hwertz10@gmail.com>) id 1f897a-0004p8-4g
	for qemu-devel@nongnu.org; Mon, 16 Apr 2018 14:44:59 -0400
Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233]:35461)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hwertz10@gmail.com>)
	id 1f897X-0004m2-75; Mon, 16 Apr 2018 14:44:55 -0400
Received: by mail-wr0-x233.google.com with SMTP id w3so12183289wrg.2;
	Mon, 16 Apr 2018 11:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=E+6ALRmIY4jVmWdxF+qB9kFqTpzlI+PlIr9vY93iplg=;
	b=Qgn+TwldM3vtU6kV/ArYSJ6jCglWvg67NQv6eRCZfsqRYs0VdA9Ajeqn6ijIxtG7y2
	s5Yi/snVm0vWR/f+7c9Sh8r0njEBdDs9ZqJAA5vBgMIe2suoVAyeIUTTsGSMpr6VWzns
	SQ3J8u2QSHNufAO86d17TgZGyYs5z9/B5QQQKm66TpDKFj+JGx65bTwCdSb8euwafUrp
	fq3FV/bRPUZQeDI541di3XKZBqohUSEGOgpDCf5IGP8ElFg2W1gqHOLDXeNmgzzDP9gd
	TVGCOUnXN1qw7oGr7flTVaaV8L7Pz9ky0cUcUmeMqbOmwlPUdnuGEorNr83c9H4nWshH
	NxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=E+6ALRmIY4jVmWdxF+qB9kFqTpzlI+PlIr9vY93iplg=;
	b=LNERlPR1liCacjpzKASaFedMitaFAykAyclFkQ8u4/J5eaPWKZxRD9lh4Gyzuw4a6r
	LZbx8J36aFDfOSFwUsW0simkvG4BWNnU5ClaAIb4rekESrJQECIapfxXRouXcBPb9t1v
	06EBB1kyrKc3cwAzZxvpBhkdyRJh/RBxikTa5TjNVFaoJMBR86OUL5iGVgnKRx4vcuzA
	CCUbDaOIWVbGKRPTbmzsMTG6N4/Z7qLboGN8+J5Z6qnXazAGy/4fzEv8GWxL9hTjYSsS
	Z+G7yuRp5fWf8W2uBmP0ZHC7vWbvLwcZVV8fphg9tmbyj10UNVYmFj8hQgPPc3iaD4B2
	uSqw==
X-Gm-Message-State: ALQs6tAzSZrOLMnqYugEHu6aR3JFs5I76lybtr1MHRYCb9fwlOnp79fA
	YJH5XUfKl9ME7XMb07wHDKWBdA4iYRRVXqnX1XlbCdmY
X-Received: by 10.28.93.1 with SMTP id r1mr6713199wmb.2.1523904293005; Mon, 16
	Apr 2018 11:44:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.129.104 with HTTP; Mon, 16 Apr 2018 11:44:52 -0700 (PDT)
From: Henry Wertz <hwertz10@gmail.com>
Date: Mon, 16 Apr 2018 13:44:52 -0500
Message-ID: <CAOuPqTE8GsN_+REWzSt4DOiqddSbZC-kOH=WnYG3U8ge3GsLoA@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/mixed; boundary="001a11469e3c0eed180569fb9e8a"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::233
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: [Qemu-devel] Patch for ARM memory barriers and getdent
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0pWevVz+SMF9

--001a11469e3c0eed180569fb9e8a
Content-Type: text/plain; charset="UTF-8"

Please find submitted a patch for ARM memory barriers.  This patch is
against qemu-2.12-rc2 but I do believe it should apply for anything from
2.11.x to current.

I found with qemu 2.11.x or newer that I would get an illegal instruction
error running some Intel binaries on my ARM chromebook.  On investigation,
I found it was quitting on memory barriers.
qemu instruction:
mb $0x31
was translating as:
0x604050cc:  5bf07ff5  blpl     #0x600250a8

After patch it gives:
0x604050cc:  f57ff05b  dmb      ish

In short, I found INSN_DMB_ISH (memory barrier for ARMv7) appeared to be
correct based on online docs, but due to some endian-related shenanigans it
had to be byte-swapped to suit qemu; it appears INSN_DMB_MCR (memory
barrier for ARMv6) also should be byte swapped  (and this patch does so).
I have not checked for correctness of aarch64's barrier instruction.
-------------------------------
Please find submitted a patch for getdents (this system call stands for
"get directory entries", it is passed a file descriptor pointing to a
directory and returns a struct with info on the entries in that
directory.)  This patch is against qemu-2.10 series but continues to apply
cleanly on current as of April 15 2018.  If you are running a 32-bit binary
on 64-bit target current qemu will convert he getdents struct, but it will
NOT in the case of 64-bit binary on 32-bit host.  (In my case, I had
android SDK's "aapt" for x86-64 error out on 32-bit ARM without this patch,
and run fine with it.)  This patch simply replaces a "#if TARGET_ABI_BITS
== 32 && HOST_LONG_BITS == 64" with "#if TARGET_ABI_BITS != HOST_LONG_BITS".

Thanks!

--001a11469e3c0eed180569fb9e8a
Content-Type: text/x-patch; charset="US-ASCII"; name="arm-mb.patch"
Content-Disposition: attachment; filename="arm-mb.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jg2l7sjc0

KioqIHRjZy9hcm0vdGNnLXRhcmdldC5pbmMuYy5vcmlnCTIwMTgtMDQtMDQgMTU6Mjg6NTAuMDAw
MDAwMDAwIC0wNTAwCi0tLSB0Y2cvYXJtL3RjZy10YXJnZXQuaW5jLmMJMjAxOC0wNC0xNiAxMjo1
NTowNC45MTc1MTg4OTggLTA1MDAKKioqKioqKioqKioqKioqCioqKiAxNTgsMTY3ICoqKioKICAg
ICAgSU5TTl9MRFJEX1JFRyAgPSAweDAwMDAwMGQwLAogICAgICBJTlNOX1NUUkRfSU1NICA9IDB4
MDA0MDAwZjAsCiAgICAgIElOU05fU1RSRF9SRUcgID0gMHgwMDAwMDBmMCwKICAKISAgICAgSU5T
Tl9ETUJfSVNIICAgPSAweDViZjA3ZmY1LAohICAgICBJTlNOX0RNQl9NQ1IgICA9IDB4YmEwZjA3
ZWUsCiAgCiAgICAgIC8qIEFyY2hpdGVjdGVkIG5vcCBpbnRyb2R1Y2VkIGluIHY2ay4gICovCiAg
ICAgIC8qID8/PyBUaGlzIGlzIGFuIE1TUiAoaW1tKSAwLDAsMCBpbnNuLiAgQW55b25lIGtub3cg
aWYgdGhpcwogICAgICAgICBhbHNvIEp1c3QgU28gSGFwcGVuZWQgdG8gZG8gbm90aGluZyBvbiBw
cmUtdjZrIHNvIHRoYXQgd2UKLS0tIDE1OCwxNjcgLS0tLQogICAgICBJTlNOX0xEUkRfUkVHICA9
IDB4MDAwMDAwZDAsCiAgICAgIElOU05fU1RSRF9JTU0gID0gMHgwMDQwMDBmMCwKICAgICAgSU5T
Tl9TVFJEX1JFRyAgPSAweDAwMDAwMGYwLAogIAohICAgICBJTlNOX0RNQl9JU0ggICA9IDB4ZjU3
ZmYwNWIsCiEgICAgIElOU05fRE1CX01DUiAgID0gMHhlZTA3MGZiYSwKICAKICAgICAgLyogQXJj
aGl0ZWN0ZWQgbm9wIGludHJvZHVjZWQgaW4gdjZrLiAgKi8KICAgICAgLyogPz8/IFRoaXMgaXMg
YW4gTVNSIChpbW0pIDAsMCwwIGluc24uICBBbnlvbmUga25vdyBpZiB0aGlzCiAgICAgICAgIGFs
c28gSnVzdCBTbyBIYXBwZW5lZCB0byBkbyBub3RoaW5nIG9uIHByZS12Nmsgc28gdGhhdCB3ZQo=
--001a11469e3c0eed180569fb9e8a
Content-Type: text/x-patch; charset="US-ASCII"; name="qemu-getdents.patch"
Content-Disposition: attachment; filename="qemu-getdents.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jg2l7slu1

KioqIGxpbnV4LXVzZXIvc3lzY2FsbC5jfgkyMDE3LTAzLTA0IDEwOjMxOjE0LjAwMDAwMDAwMCAt
MDYwMAotLS0gbGludXgtdXNlci9zeXNjYWxsLmMJMjAxNy0wMy0wNyAxNzowODoyNC42MTUzOTkx
MTYgLTA2MDAKKioqKioqKioqKioqKioqCioqKiA5OTEzLDk5MjEgKioqKgogICNlbmRpZgogICNp
ZmRlZiBUQVJHRVRfTlJfZ2V0ZGVudHMKICAgICAgY2FzZSBUQVJHRVRfTlJfZ2V0ZGVudHM6CiAg
I2lmZGVmIF9fTlJfZ2V0ZGVudHMKISAjaWYgVEFSR0VUX0FCSV9CSVRTID09IDMyICYmIEhPU1Rf
TE9OR19CSVRTID09IDY0CiAgICAgICAgICB7CiAgICAgICAgICAgICAgc3RydWN0IHRhcmdldF9k
aXJlbnQgKnRhcmdldF9kaXJwOwogICAgICAgICAgICAgIHN0cnVjdCBsaW51eF9kaXJlbnQgKmRp
cnA7CiAgICAgICAgICAgICAgYWJpX2xvbmcgY291bnQgPSBhcmczOwotLS0gOTkxMyw5OTIxIC0t
LS0KICAjZW5kaWYKICAjaWZkZWYgVEFSR0VUX05SX2dldGRlbnRzCiAgICAgIGNhc2UgVEFSR0VU
X05SX2dldGRlbnRzOgogICNpZmRlZiBfX05SX2dldGRlbnRzCiEgI2lmIFRBUkdFVF9BQklfQklU
UyAhPSBIT1NUX0xPTkdfQklUUwogICAgICAgICAgewogICAgICAgICAgICAgIHN0cnVjdCB0YXJn
ZXRfZGlyZW50ICp0YXJnZXRfZGlycDsKICAgICAgICAgICAgICBzdHJ1Y3QgbGludXhfZGlyZW50
ICpkaXJwOwogICAgICAgICAgICAgIGFiaV9sb25nIGNvdW50ID0gYXJnMzsK
--001a11469e3c0eed180569fb9e8a--
