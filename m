Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2169446wrt;
        Thu, 24 Jan 2019 09:12:45 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4MEV7xoe5H+GtO5AIOCwsCsRF97BfYmp2GJAWaM0dKK1MIgtwuB6a2R0TgGyDB9Y3dGwwY
X-Received: by 2002:a7b:cb0a:: with SMTP id u10mr3643707wmj.0.1548349965632;
        Thu, 24 Jan 2019 09:12:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548349965; cv=none;
        d=google.com; s=arc-20160816;
        b=0tE6xar35gQ3K9Pc3TVMxZui2P+nV8A2ejZH+wVLII5rJCFGH/bv4bvrSaG+4Hv5bF
         rNZn7PQd+i+j0lgjZALGzd9Nzf9ib2056TvPTzNwLmLYAmLBoq9s/tnGgZc4c8N9ZZyB
         9T20Rx4ah9AabwJJ9ChTlFBSFphn9NQ3QTGAWYSxpweGD2fsz2RsY+R7BNzK8olJ8Woi
         8Mq8zeRzw6JP87Y+EBMTIXjbHrXt4krPdJb8l4iGX1sCRGSCLfDKETEJ3xZb7XYPI9Ig
         B0RMvKixeqJSST0c0r9LpNwX/bQ2mfhEbbgMIpVAbCGBmh+PYj5CF7yyf/dEn9BYzauJ
         VZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature;
        bh=Way8fkXSAx1lcdHGvGgsSwtSiGBfsiDYwz8R84/K64k=;
        b=x4UCseg2hbjinxN7Udrv+odhBB63FmP8ul0wl+CmgmFlGiycgcXgqETkYTpyl/oSYe
         yYjLoNzaHvkwD9RBGKdNIl07G+WwpG1/mnQMVYevuau0EF2twqKpafBxXHG73N2FFr89
         JBU+00/ewpKGBrGXJAplE/7/TqgAMGjISxnjUMwSwVIMvDH9ZB577THIJEx4+wP5nSCo
         tNsAw09/JZBO79nzqms50i9w8cQRT8/tqUiJaHelLKTKszJ2KbQCKDceY+fHCGSdkCst
         fududM6boIpAOBnRP/0qp5ziC305nN54obBXCPZdod+Ppn58WRy2JkWH/FYDuv4VWTur
         uP8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f3MM7wJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u185si31614081wmg.131.2019.01.24.09.12.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 09:12:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f3MM7wJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:57229 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmiYW-0007Y7-Mj
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 12:12:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1gmiYL-0007WJ-O9
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 12:12:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1gmiYC-0000i4-Q2
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 12:12:26 -0500
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:43934)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1gmiYC-0000gU-C3; Thu, 24 Jan 2019 12:12:24 -0500
Received: by mail-io1-xd31.google.com with SMTP id b23so5328728ios.10;
	Thu, 24 Jan 2019 09:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=Way8fkXSAx1lcdHGvGgsSwtSiGBfsiDYwz8R84/K64k=;
	b=f3MM7wJrKMB9BizGODkeQEE+nUbxvK1tCv9QBLGd3qs8dAeacWOFYNZM/D54fAfJKj
	gOU2nna8yYg+LNQBSN29no6eWsLznERExwfkZASRnZUg9XN+DGHBYX8X6RrhvuR0bgp8
	FRFfGcsxLDk0Mh/RVQz9FMB1E1BGIPJwS7R5RkgBNlVC/trH5xxGEOlSloTH5cR2d1bA
	4oyDSxaDLeLODFa7IJ3uaSgK2CkdIlKVrHKM8yTGjXcdSSf0nz2xJ5R03b/a9pVE+hqT
	o3Nnd4Q9XBBq+3DZ45KoJyvcUk+z2uuG03NCoxbhZ4OTY796u+o1SP6FhrEgz+8elMbs
	WssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=Way8fkXSAx1lcdHGvGgsSwtSiGBfsiDYwz8R84/K64k=;
	b=tAqm4a1No1ztRPQQ3earn+NWIY+4sI7/wIxmV0kEY+eoVjQI9/vu+2ZsvZeZlrjqjm
	03FPOs0unueWSm2ZbQRpCHw+9Bl/wXsryOyHvt6s7ZLpbacVyjuodU0uzAp9s2Dr+WFO
	kqOE4mTWnrikFGkO6DsPbOFntel1dgtbt9Cw/+k8igq+uW7iBw98dz1eSQZu/VHfJiF3
	pYGuN3xdDdWnqxB118rgLs1isjnU+DyMGZQ3PMSpkD1iOWrIEdzHfI94EXiqCJiy4aJt
	hgyMpjC+BwxQIIUUrNAe4Ikc+TBuum4B5RLg8l3QawJCjgxX8nwh1wkXdybA5SDWMF74
	0OZA==
X-Gm-Message-State: AHQUAuaMV8bkU5DwT0iXXW1UAdJ+yCHrDz2TLYxb4TRL+pTcdXSo5+Zh
	KBx2TdMzD++Iuv0ywWSuvYqH8o1atAQ+o/dQUfmQupSzoLo=
X-Received: by 2002:a6b:c815:: with SMTP id y21mr4046067iof.98.1548349940760; 
	Thu, 24 Jan 2019 09:12:20 -0800 (PST)
MIME-Version: 1.0
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Thu, 24 Jan 2019 18:12:27 +0100
Message-ID: <CABoDooOvD_GWJovXjDSQY640seOCn+zLQzxehSgUmYQss9H83Q@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::d31
Subject: [Qemu-arm] AArch64: some missed undefined instructions
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bmkGwXT78kSZ

Hello,

I did exhaustive comparisons against latest binutils and found the
following undefined instructions that QEMU fails to flag:

- in disas_b_exc_sys, before calling disas_system bits [23:22] should
be checked to be 0

- in disas_ldst_reg_imm9, PRFM is wrongly detected:  PRFM is for idx =
0, not for is_unpriv, the rest being undefined

- in disas_ldst_multiple_struct, if the instruction is not
post-indexed, then bits [20:16] should be checked to be 0

- in disas_ldst_single_struct, if the instruction is not post-indexed,
then bits [20:16] should be checked to be 0;  also bit [31] should be
0

- in disas_add_sub_ext_reg, bits [23:22] should be checked to be 0

- in disas_data_proc_1src, there's a missing default that would flag
undefined instructions

- in disas_fp_1src, disas_fp_2src, disas_fp_3src, and disas_fp_imm
bits,  [31:29] should be checked to be 0

- in disas_fp_imm, bits [9:5] should be checked to be 0

- in disas_simd_indexed, SDOT and UDOT are not scalar instructions.

That's all I found.  I hope I didn't make any transcription error :-)

Thanks,

Laurent
