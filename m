Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp2167350ejb;
        Mon, 29 Apr 2024 05:26:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXrxeBr7s8VigoINZ1uhgjs+9fJZ/8BzezDYdhDWIjACSAXhxeYE2rXmFrcwIpTDkOCGg2eFal4BYh6zCe80C8sEiqRTM66
X-Google-Smtp-Source: AGHT+IE9kWjlemOilnG5GK3xMzmyNpsruGqBW7qKBrYD+50zMnMkW8i3QMucp9Ek/HKnOID3TDPd
X-Received: by 2002:a05:600c:3509:b0:41c:11fe:4de3 with SMTP id h9-20020a05600c350900b0041c11fe4de3mr3298826wmq.24.1714393573272;
        Mon, 29 Apr 2024 05:26:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714393566; cv=none;
        d=google.com; s=arc-20160816;
        b=frd5xv/SkxtGfu0n8UQ/5UqSiz0lzMhnBjcxnjRP4w3VrAQq+SCCVo5MN2MkUXUPwr
         BMBI/vCpXJeY+iubYO+PD2DKEFwIQNLdDs0xoRQ7gMdodfI0PYh+aosxIE6G32Eyjefd
         4X7/VbIdx00p6PbFWo41q52iYUKJXMkkd7zRqU1c3VVfDlqQpMGBHk2J6LM66ABYByhe
         02KCEMsas+Ueg7mFiVKUxAgGjaqyJ90RYuhjizQHjuDpcC7VP3N+JN9V3azVu3XsFH0R
         yfPtR3WSQL8X/89ZQ7KuYqGdfuwS7mTIJu/WBMDEnfLPaOaZe2sQpmUxT6+mRuJkPVxr
         qOJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=4t3mGQcy8q78dkJHZiDOefJgmFaFgFaothUmIGmchlc=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=DCspMZJ/zDW5w17r2YW8HBnmfZLHGyHIbcR3nqtJo/vQrhU4P4vQcxwoUtunBB/UpX
         dZXuYJWAsIG3JWCJpnJZuXWAXAfVOAhkbw8prpato2uVN0NpzfGmUBDtCg8fulplAsQM
         dbl2jtlg6VRT+TzM8Rz3kr2fGgHZQVrO4cpX5e0D7YrcPJc4xgSr64ggoONAGJVzhHy4
         O72rOY7p5C3VNlmjDJSmoJeZQ8yEjcTnbMuU/KCbBXTYi5bwFAjX9dhTkQ8S5dEJptTT
         fGF4uJ8vIuTrZ3jvSvN4D3V39St5nzZtAPQJbbYbFx6Fmb56OialNUdxJECSapKvq3OI
         S2tg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nb5lUPzt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17-20020a05600c365100b004154535a6c3si9187774wmq.133.2024.04.29.05.26.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2024 05:26:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nb5lUPzt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s1Q4z-0008EJ-Vl; Mon, 29 Apr 2024 08:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krishna125g@gmail.com>)
 id 1s1NlE-0002wa-73
 for qemu-arm@nongnu.org; Mon, 29 Apr 2024 05:57:24 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <krishna125g@gmail.com>)
 id 1s1NlC-0003Ck-2L
 for qemu-arm@nongnu.org; Mon, 29 Apr 2024 05:57:23 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6ea156bee62so2289377a34.0
 for <qemu-arm@nongnu.org>; Mon, 29 Apr 2024 02:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714384638; x=1714989438; darn=nongnu.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4t3mGQcy8q78dkJHZiDOefJgmFaFgFaothUmIGmchlc=;
 b=Nb5lUPzt6z/lqCYsxyMylABLhAAjQwa6ejNstdjo1NWNPLNBkuwuTeBAVtxUt3aYDR
 LvYp0O/WwPjkFLInWgugYCWceNtGEoyyKuKUCKDM2NvFnttU6xmeGU85QZKUhtSd6DMl
 QNyihfLmD8D8HgThsynPaYvNbOTX0egm/HmajKYHoq2vbPvfgvScOoqelGAxMsZUKbj/
 cH9f8x9bNN1ku1eeDhurK/jtkIGXVa3jhJBVxm8TEiZ06K3JIsCBnUWM+1700i/qajXp
 pgn9pj2n+jj1xcGXg0bmp6LOnR+1+0ujF5uQfA+WcptAgaWAQPDcXwM+qBcpKn5FY9t1
 P0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714384638; x=1714989438;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4t3mGQcy8q78dkJHZiDOefJgmFaFgFaothUmIGmchlc=;
 b=DLqXyVAvRQIDlXQJvqtRHe7rFYkv9APiGBMykrUdwOReb+jniTio85gUQmLPyPfNCE
 Bj/7PKjrTGZZO8eygKyh9uR90ve8vhTZeDzsEIwFr/Bi7KiTL5VKUljmA6vNumPtaDk6
 1wZKlt9DJClTACEN/lJ3/5gxQdwLVuM+GJprfwFVANo8yi0qHsf/xYPmxa4qQW99Fjg2
 b4muwAPJdcQYNZfiWeMq3XDGlWJNQ3aO1Fcid9IpecVmsoO/ZrFIfi0pM2GINvuk+2fW
 uxPP59gM5hX94vu8iQIaJONxbrVB2yf/8XnsoSWHE/jICBnoAcvazpS2sB/F0VIeZvki
 mdXQ==
X-Gm-Message-State: AOJu0YxGBnvGfhgJFADH3UXUuhxeUWZ+AfxhLmXjFSazDgm6iVro/6r3
 1QGOEysuLCSMC0O/9EvbqWN4j8jTUN0Vhivf+u3bqSOjhk6a9RNjeIZQW2AQVJd9U8Q6rEaJzb0
 9i4+8n63U6smS4YFfkiZcHyq9VnybrfCnZNg/2g==
X-Received: by 2002:a05:6808:210e:b0:3c8:4cdf:52f8 with SMTP id
 r14-20020a056808210e00b003c84cdf52f8mr3603612oiw.0.1714384638301; Mon, 29 Apr
 2024 02:57:18 -0700 (PDT)
MIME-Version: 1.0
From: Krishna Gururaj <krishna125g@gmail.com>
Date: Mon, 29 Apr 2024 15:27:07 +0530
Message-ID: <CAH9tv=PKi3B44y4+gvTa9CpJHNN4UAeyvgxFwXCjUVM3Qy=ppA@mail.gmail.com>
Subject: QNX in qemu
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000005fe4490617394768"
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=krishna125g@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 29 Apr 2024 08:25:56 -0400
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
X-TUID: mjwfMlqOJ9vE

--0000000000005fe4490617394768
Content-Type: text/plain; charset="UTF-8"

Hello,

I am trying to run the gles2-gears binary in qnx with the following
configuration :

qemu-system-aarch64.exe -machine vexpress-a15 -cpu cortex-a57 -smp 4 -m 30G
-kernel ifs.bin -drive file=disk-qemu.vmdk,if=none,id=drv0 -device
virtio-blk-device,drive=drv0 -netdev
tap,id=mynet0,ifname=TAP_Ethernet,script=no,downscript=no -device
virtio-net-device,netdev=mynet0,mac=52:55:00:d1:55:01 -device
virtio-rng-device -nographic


The binary is getting loaded but I do not see any graphics.

But, when I enable the vnc server and capture it on the host I am able to
see the graphics.
My intention is I want to see the graphics on the qnx in qemu.

Thank You,
Krishna

--0000000000005fe4490617394768
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I am trying to run the gles2-gears binary in=
 qnx with the following configuration :<div><span style=3D"color:rgb(23,43,=
77);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Robot=
o,Oxygen,Ubuntu,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetic=
a Neue&quot;,sans-serif;font-size:14px"><br></span></div><div><span style=
=3D"color:rgb(23,43,77);font-family:-apple-system,BlinkMacSystemFont,&quot;=
Segoe UI&quot;,Roboto,Oxygen,Ubuntu,&quot;Fira Sans&quot;,&quot;Droid Sans&=
quot;,&quot;Helvetica Neue&quot;,sans-serif;font-size:14px">qemu-system-aar=
ch64.exe -machine vexpress-a15 -cpu cortex-a57 -smp 4 -m 30G -kernel ifs.bi=
n -drive file=3Ddisk-qemu.vmdk,if=3Dnone,id=3Ddrv0 -device virtio-blk-devic=
e,drive=3Ddrv0 -netdev tap,id=3Dmynet0,ifname=3DTAP_Ethernet,script=3Dno,do=
wnscript=3Dno -device virtio-net-device,netdev=3Dmynet0,mac=3D52:55:00:d1:5=
5:01 -device virtio-rng-device -nographic<br><br><br>The binary is getting =
loaded but I do not see any graphics.<br><br>But, when I enable the vnc ser=
ver and capture it on the host I am able to see the graphics.<br>My intenti=
on is I want to see the graphics on the qnx in qemu.<br><br>Thank You,<br>K=
rishna=C2=A0</span></div></div>

--0000000000005fe4490617394768--
