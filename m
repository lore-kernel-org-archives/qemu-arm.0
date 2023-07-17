Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp5972117eje;
        Mon, 17 Jul 2023 14:52:29 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGEdUAq2R5ll0BlzsBAIH6qMGxEMyPKeX8L+BNNNLRx3IkbNnD1PC908qmDeRSf9FkXXefW
X-Received: by 2002:a05:620a:24d2:b0:767:3d3e:4dc2 with SMTP id m18-20020a05620a24d200b007673d3e4dc2mr16009194qkn.32.1689630749232;
        Mon, 17 Jul 2023 14:52:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689630749; cv=none;
        d=google.com; s=arc-20160816;
        b=MK3uzJuMD+PH7wNL3DhZv+R+6ClV/iqRZCtgG7ce49XFWAhRpiIUXv3/h9lpgYdT+5
         ur7s9qvoAB8hrLwql8MCowcBjOjjqqn4qGv06hVVBi3KU5u7gw/V/bEkRZHBxs9CW9kN
         1VZZ6krZh9j82tJTCUvdeGLozmtmq69zet/2W4HxXtvekRHedd7R3Jy3jhpgLkeWLdrC
         cIqJ96dWSk0f+cHLDwq9X+d1KH0J22z1Yg18OoiugkUhB503/Bsf42HeL0ZJbF69bQ7x
         7k6+qAdGgR533tJPlV3/X2/yYG/JVLrLUGVqSyGkGTRORs/SXhhx+bLdmLv/0sge/0l7
         eLtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:message-id:subject:from:to:dkim-signature
         :date;
        bh=EsbkskaRF0oJyPNKlajASN+khC26Zb34VB2Xi2lcYIo=;
        fh=tPNmEPtw1dh+JX8cKy4WbUkPvd7CLoFt2QrzUJEPmBo=;
        b=MA07diGq6YN2s8ahLVONE/1rfpo6b32C6cgF7MiTCBS7ATJ64zcgGm+YdrjRJnEhW0
         kXh1ttO1F5yOe3S7nRNnXvAaZZgg3Pn4DJNzDf9gIHp9MFYvzoB9TA6FNVCaY/iyfavb
         mjXdSI5jTSDaDs3mSrCqmhthdjbcVAMRyFYWKDPNWxX2RH68vjxftv3axYQvCrVfKqg0
         W/PvdbFVKq0PZX1Rd8WtxLE3bWlVtYwi5NFLJ/64wWv99qWGTFjgmQEJab4Y4jnis4FC
         tXDzPAao6AQ9Spx70TEJzo6njjV3VyBzSg7VXwSqxaFMOPteHNIQFmgFvum9ZiTghGWA
         LaRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=JU79hzc1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cz2-20020a05620a36c200b00765bfc4a6fdsi175331qkb.652.2023.07.17.14.52.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jul 2023 14:52:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=JU79hzc1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qLW86-0003tX-6a; Mon, 17 Jul 2023 17:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qLW84-0003so-3l
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 17:51:40 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qLW82-0003T1-0M
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 17:51:39 -0400
Date: Mon, 17 Jul 2023 21:51:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1689630685; x=1689889885;
 bh=EsbkskaRF0oJyPNKlajASN+khC26Zb34VB2Xi2lcYIo=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=JU79hzc1dXsBUAkhbTDjirFP+GfJ2JId1MGnph6UVQQW/moHDdxDZmdOAJ7HiQQkc
 cBF9lG8yXP6bTRHeTA2YdDovUb+bYBL41pEIasDxo9JKSpoKnixyjY+/WFvog8ZtGz
 XiqRiFJEBkmjZ4WPtT2U1CWFncHlqgWV0oNrzmDltWDHVHAKIPBFRnWjTOWiU6oKxj
 Tb0HBar99XUr4hVlryErVgNyakWuF+UzMTVIv2/Kt1OPScCqvG5CDfafSn8olNQ0vy
 KnBcVCrtgmfHQdGmtSelqvkKK0zCY0tG/IL5lnd6Zp1+fyqTbBs4JgWT4WUD5HBJ3G
 rWdU4AHmMtGOQ==
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
From: Chris Laplante <chris@laplante.io>
Subject: Thoughts on implementing SEGGER RTT
Message-ID: <1mjgMzNMSQPXkdhRsPwsqABs5nbyxQA3jzrbzEPckVa1WhBvzGSP3L5ZRftans6RflTNGovEUJu5WtNCUJF0HFlFWbUC7qPyvQygPhEAU1U=@laplante.io>
Feedback-ID: 43500449:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=51.77.79.158; envelope-from=chris@laplante.io;
 helo=mail-0201.mail-europe.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: mMl2ZLw0plrW

Hi all,

SEGGER RTT (https://wiki.segger.com/RTT) is a software debug mechanism whic=
h, among other things, exposes convenient virtual terminals. It is implemen=
ted as ring buffers in RAM. There is a control block with a fixed ID so it =
can be located by the RTT viewer (which runs on your PC, for example) at ru=
ntime.

I'm considering what it would take to implement an RTT viewer in qemu. Some=
 small parts would be easy:

- Add a '-rtt' command line option
- Use=C2=A0address_space_read or flatview_* stuff to locate the fixed ID in=
 the control block

But I don't yet know enough about QEMU to understand some bigger picture th=
ings:

- I assume the code for reading messages would need to live in a QemuThread=
?=20
- Where would I output virtual terminal messages to?
- In the case of bidirectional communication, how would a user input messag=
es to send to the emulated device?
- Is there a way to monitor memory ranges for changes, or would I need anot=
her way to detect when new messages are in the ring buffer?

Another possibility (which would avoid the last 3 issues, but of course cre=
ate more complexity in other areas) is to have QEMU emulate a SEGGER J-LINK=
 and provide a TCP/IP endpoint that a real RTT Viewer could connect to (htt=
ps://www.segger.com/products/debug-probes/j-link/tools/rtt-viewer/). I'm no=
t sure how feasible this is, though.

If anyone has any thoughts or guidance I'd appreciate it.

Thanks,
Chris
