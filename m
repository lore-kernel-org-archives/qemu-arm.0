Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp1216620ejt;
        Fri, 16 Jun 2023 00:23:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ425771/Ej0T+UV6Jg6cRXzkxkLC2TW+CQQR37pHAUHFCP1nlZnLHx7pFPoHGJwD0jEqX3c
X-Received: by 2002:a05:622a:587:b0:3f3:90a8:6906 with SMTP id c7-20020a05622a058700b003f390a86906mr2119650qtb.17.1686900210361;
        Fri, 16 Jun 2023 00:23:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686900210; cv=none;
        d=google.com; s=arc-20160816;
        b=oE5gzsGdaCIXKHAGYxr0mlr8MXhjrVjei/1d6yMI835OkeBTTnDlm8Qc2KhUy/dKB0
         SchNLw5RaaUEx2zrWMTuACQdnBUDq1aOlQaP6vcHidfZSAQRRjZ8MoUX4MMa9p58oEvJ
         mnRkFcjVCNC636wTclvotDpQGoxbJ1ws64TuOcHYTEc+sKIs8E2y++WSJLIGqg5wRCUd
         /xUZ6YTukhdrVttOSMoADN5H103bcYwLzGea22O8sW9VbPjjQC/HUyVlD4w27QtNXGyt
         LAyPouOLC7VQT1ir4SXKcR1yl7oTTBh4+p1ZYqtmb/91BHtLJRUyfIkvsjYX5FMbhyMe
         MFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:from:subject:to:message-id:date
         :mime-version:dkim-signature;
        bh=wuYYOpPr+FECaM+EopRP6sN3+vJLkhPjkW25BdC4XsY=;
        b=gbAygPeYwcVURM/hR3ZtqMjcwg2uqukwUpm/OM7NCCxaMlJuhBIJscXmstiolXWrfJ
         O8LygjVu2iGYg2D12b9gxIZ7swuHWiBbS2Kr4bf2V/2MvlCe0+qZrrIGd9YDe2WKpe0e
         ZH1+7OLJL5MibBZ4ZzR0An2q32/BmO1/lFP8JKqGYGKm/9Qzaxb5aFdIWUFFj80nIGst
         JkxSHx7lW6R/9TUeK2goF0x5GJh4xImOvHFbqm517+TKPRiVWJo9h+e8gsEAuTDO8tpN
         C1mR7sf5eSRwadFxMz7Il9LlrepeaUOMx48+YcbUoG4etVBL3Bz6w2+f/zsRPtfqyAb5
         irAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@enjoymove.com header.s=feishu2304261427 header.b=bEqOUVau;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=enjoymove.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1-20020a05622a134100b003f9b57f32efsi10311987qtk.770.2023.06.16.00.23.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jun 2023 00:23:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@enjoymove.com header.s=feishu2304261427 header.b=bEqOUVau;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=enjoymove.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qA3nd-0007Dh-4C; Fri, 16 Jun 2023 03:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xian.lv@enjoymove.com>)
 id 1qA3nW-0007DQ-Qp
 for qemu-arm@nongnu.org; Fri, 16 Jun 2023 03:23:06 -0400
Received: from t03.bc.larksuite.com ([209.127.231.39])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xian.lv@enjoymove.com>)
 id 1qA3nT-0001sA-IL
 for qemu-arm@nongnu.org; Fri, 16 Jun 2023 03:23:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2304261427; d=enjoymove.com; t=1686900175; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=wuYYOpPr+FECaM+EopRP6sN3+vJLkhPjkW25BdC4XsY=;
 b=bEqOUVaukIXCxdJg/B051bzA5dSwE0EKmYUCgomDVzMLu6ktZxu5lIWPLv1txd5Az255Qf
 seEpbJMp4nX19MGquLa5hSUKSA1UQt3j2Vp8iWMxO3YYfI+XO6y5/ZZ5IG7ckIkrKLCeht
 RgA9Wf1118Yw8N9b1PlimFlrZAMg4HrjCOBuUuR9L1vDbOG52B9wvQJ4mOZ3NUhOjgLOqm
 dUaK4QD2eQn8NDa5P/e1bPUHA+a3qR2KZTr0qIBuL2g7jSEeWQn4VfztzNN/YpR1rj7nHH
 qtt5DJdFlXyNK/wmE+CDkGtml1VvD508c+pDoQzXQdAIXmDzCOYxMJ++a2YkDA==
Mime-Version: 1.0
X-Lms-Return-Path: <lba+1648c0dce+220f0b+nongnu.org+xian.lv@enjoymove.com>
Content-Type: multipart/alternative;
 boundary=bfa2fb542e7323460e7575b0de93ad2b4ebe872ff96219d724d6a1e8549a
Date: Fri, 16 Jun 2023 15:22:54 +0800
Message-Id: <cdacca34302f3eb2b71addffba1e6b89d7f4a190.59e36293.4646.46a0.a1bb.76c2198a3286@feishu.cn>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: No print info when starrting qemu-system-aarch64
From: =?utf-8?q?=E5=90=95=E8=B4=A4?= <xian.lv@enjoymove.com>
Received-SPF: pass client-ip=209.127.231.39;
 envelope-from=xian.lv@enjoymove.com; helo=t03.bc.larksuite.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: dhjeMoKCutzK

--bfa2fb542e7323460e7575b0de93ad2b4ebe872ff96219d724d6a1e8549a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Dear qemu guys,

=C2=A0=C2=A0=C2=A0 I've met with a strange problem when using qemu as simul=
ator for arm64.
I tried to start qemu with the command below:
------
sudo qemu-system-aarch64 -machine virt -cpu=C2=A0cortex-a72 -smp 2 -m 2048 =
-kernel=C2=A0Image=C2=A0-append "console=3DttyAMA0 root=3D/dev/vda" -nograp=
hic -drive file=3Dramdisk.img -drive file=3Ddisk.img -nic tap,model=3De1000=
,script=3D/etc/qemu-ifup
------
The file:Image=C2=A0is the kernel bin of linux kernel =C2=A0which=C2=A0comp=
iled with default config.
While I tried with linux kernel-5.15, then the simulator can=C2=A0be starte=
d properly.
For=C2=A0the=C2=A0kernel 6.3.8; kernel-5.10.130, the result is OK as well
But there's no output info after the command executed if the kernel before =
4.19 is used.
Is there any problem when early linux kernel (before 4.19) is used for qemu=
 tools ?
Thank you so much.

BestRegards,
Rex=C2=A0
--bfa2fb542e7323460e7575b0de93ad2b4ebe872ff96219d724d6a1e8549a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<div id=3D"editor_version_1.36.9_yHIsAnuG" style=3D"word-break:break-word;"=
><div data-zone-id=3D"0" data-line-index=3D"0" data-line=3D"true" style=3D"=
font-size: 14px; margin-top: 4px; margin-bottom: 4px; line-height: 1.6;"><s=
pan style=3D"font-size: 14px;"><span style=3D"font-family: LarkHackSafariFo=
nt, LarkEmojiFont, LarkChineseQuote, -apple-system, BlinkMacSystemFont, Tah=
oma, &quot;PingFang SC&quot;, Arial, sans-serif;"><span style=3D"color: rgb=
(31, 35, 41);"><span style=3D"background-color: rgb(255, 255, 255);">Dear q=
emu guys,</span></span></span></span></div><div data-zone-id=3D"0" data-lin=
e-index=3D"1" data-line=3D"true" style=3D"font-size: 14px; margin-top: 4px;=
 margin-bottom: 4px; line-height: 1.6;"><br></div><div data-zone-id=3D"0" d=
ata-line-index=3D"2" data-line=3D"true" style=3D"font-size: 14px; margin-to=
p: 4px; margin-bottom: 4px; line-height: 1.6;"><span style=3D"font-size: 14=
px;"><span style=3D"font-family: LarkHackSafariFont, LarkEmojiFont, LarkChi=
neseQuote, -apple-system, BlinkMacSystemFont, Tahoma, &quot;PingFang SC&quo=
t;, Arial, sans-serif;"><span style=3D"color: rgb(31, 35, 41);"><span style=
=3D"background-color: rgb(255, 255, 255);">&nbsp;&nbsp;&nbsp; I've met with=
 a strange problem when using qemu as simulator for arm64.</span></span></s=
pan></span></div><div data-zone-id=3D"0" data-line-index=3D"3" data-line=3D=
"true" style=3D"font-size: 14px; margin-top: 4px; margin-bottom: 4px; line-=
height: 1.6;"><span style=3D"font-size: 14px;"><span style=3D"font-family: =
LarkHackSafariFont, LarkEmojiFont, LarkChineseQuote, -apple-system, BlinkMa=
cSystemFont, Tahoma, &quot;PingFang SC&quot;, Arial, sans-serif;"><span sty=
le=3D"color: rgb(31, 35, 41);"><span style=3D"background-color: rgb(255, 25=
5, 255);">I tried to start qemu with the command below:</span></span></span=
></span></div><div data-zone-id=3D"0" data-line-index=3D"4" data-line=3D"tr=
ue" style=3D"font-size: 14px; margin-top: 4px; margin-bottom: 4px; line-hei=
ght: 1.6;"><span style=3D"font-size: 14px;"><span style=3D"font-family: Lar=
kHackSafariFont, LarkEmojiFont, LarkChineseQuote, -apple-system, BlinkMacSy=
stemFont, Tahoma, &quot;PingFang SC&quot;, Arial, sans-serif;"><span style=
=3D"color: rgb(31, 35, 41);"><span style=3D"background-color: rgb(255, 255,=
 255);">------</span></span></span></span></div><div data-zone-id=3D"0" dat=
a-line-index=3D"5" data-line=3D"true" style=3D"font-size: 14px; margin-top:=
 4px; margin-bottom: 4px; line-height: 1.6;"><span style=3D"font-size: 14px=
;"><span style=3D"font-family: LarkHackSafariFont, LarkEmojiFont, LarkChine=
seQuote, -apple-system, BlinkMacSystemFont, Tahoma, &quot;PingFang SC&quot;=
, Arial, sans-serif;"><span style=3D"color: rgb(31, 35, 41);"><span style=
=3D"background-color: rgb(255, 255, 255);">sudo qemu-system-aarch64 -machin=
e virt </span></span></span></span><span style=3D"font-size: 14px;"><span s=
tyle=3D"font-family: LarkHackSafariFont, LarkEmojiFont, LarkChineseQuote, -=
apple-system, BlinkMacSystemFont, Tahoma, &quot;PingFang SC&quot;, Arial, s=
ans-serif;"><span style=3D"color: rgb(31, 35, 41);"><span style=3D"backgrou=
nd-color: rgb(255, 255, 255);">-cpu</span></span></span></span><span style=
=3D"font-size: 14px;"><span style=3D"font-family: LarkHackSafariFont, LarkE=
mojiFont, LarkChineseQuote, -apple-system, BlinkMacSystemFont, Tahoma, &quo=
t;PingFang SC&quot;, Arial, sans-serif;"><span style=3D"color: rgb(31, 35, =
41);"><span style=3D"background-color: rgb(255, 255, 255);">&nbsp;cortex-a7=
2 -smp 2 -m 2048 -kernel</span></span></span></span><span style=3D"font-siz=
e: 14px;"><span style=3D"font-family: LarkHackSafariFont, LarkEmojiFont, La=
rkChineseQuote, -apple-system, BlinkMacSystemFont, Tahoma, &quot;PingFang S=
C&quot;, Arial, sans-serif;"><span style=3D"color: rgb(31, 35, 41);"><span =
style=3D"background-color: rgb(255, 255, 255);"><b>&nbsp;Image</b></span></=
span></span></span><span style=3D"font-size: 14px;"><span style=3D"font-fam=
ily: LarkHackSafariFont, LarkEmojiFont, LarkChineseQuote, -apple-system, Bl=
inkMacSystemFont, Tahoma, &quot;PingFang SC&quot;, Arial, sans-serif;"><spa=
n style=3D"color: rgb(31, 35, 41);"><span style=3D"background-color: rgb(25=
5, 255, 255);">&nbsp;-append "console=3DttyAMA0 root=3D/dev/vda" -nographic=
 -drive file=3Dramdisk.img -drive file=3Ddisk.img -nic tap,model=3De1000,sc=
ript=3D/etc/qemu-ifup</span></span></span></span></div><div data-zone-id=3D=
"0" data-line-index=3D"6" data-line=3D"true" style=3D"font-size: 14px; marg=
in-top: 4px; margin-bottom: 4px; line-height: 1.6;"><span style=3D"font-siz=
e: 14px;"><span style=3D"font-family: LarkHackSafariFont, LarkEmojiFont, La=
rkChineseQuote, -apple-system, BlinkMacSystemFont, Tahoma, &quot;PingFang S=
C&quot;, Arial, sans-serif;"><span style=3D"color: rgb(31, 35, 41);"><span =
style=3D"background-color: rgb(255, 255, 255);">------</span></span></span>=
</span></div><div data-zone-id=3D"0" data-line-index=3D"7" data-line=3D"tru=
e" style=3D"font-size: 14px; margin-top: 4px; margin-bottom: 4px; line-heig=
ht: 1.6;"><span style=3D"font-size: 14px;"><span style=3D"font-family: Lark=
HackSafariFont, LarkEmojiFont, LarkChineseQuote, -apple-system, BlinkMacSys=
temFont, Tahoma, &quot;PingFang SC&quot;, Arial, sans-serif;"><span style=
=3D"color: rgb(31, 35, 41);"><span style=3D"background-color: rgb(255, 255,=
 255);">The file:</span></span></span></span><span style=3D"font-size: 14px=
;"><span style=3D"font-family: LarkHackSafariFont, LarkEmojiFont, LarkChine=
seQuote, -apple-system, BlinkMacSystemFont, Tahoma, &quot;PingFang SC&quot;=
, Arial, sans-serif;"><span style=3D"color: rgb(31, 35, 41);"><span style=
=3D"background-color: rgb(255, 255, 255);"><b>Image</b></span></span></span=
></span><span style=3D"font-size: 14px;"><span style=3D"font-family: LarkHa=
ckSafariFont, LarkEmojiFont, LarkChineseQuote, -apple-system, BlinkMacSyste=
mFont, Tahoma, &quot;PingFang SC&quot;, Arial, sans-serif;"><span style=3D"=
color: rgb(31, 35, 41);"><span style=3D"background-color: rgb(255, 255, 255=
);">&nbsp;is the kernel bin of linux kernel &nbsp;</span></span></span></sp=
an><span style=3D"font-size: 14px;"><span style=3D"font-family: LarkHackSaf=
ariFont, LarkEmojiFont, LarkChineseQuote, -apple-system, BlinkMacSystemFont=
, Tahoma, &quot;PingFang SC&quot;, Arial, sans-serif;"><span style=3D"color=
: rgb(31, 35, 41);"><span style=3D"background-color: rgb(255, 255, 255);">w=
hich</span></span></span></span><span style=3D"font-size: 14px;"><span styl=
e=3D"font-family: LarkHackSafariFont, LarkEmojiFont, LarkChineseQuote, -app=
le-system, BlinkMacSystemFont, Tahoma, &quot;PingFang SC&quot;, Arial, sans=
-serif;"><span style=3D"color: rgb(31, 35, 41);"><span style=3D"background-=
color: rgb(255, 255, 255);">&nbsp;compiled with default config.</span></spa=
n></span></span></div><div data-zone-id=3D"0" data-line-index=3D"8" data-li=
ne=3D"true" style=3D"font-size: 14px; margin-top: 4px; margin-bottom: 4px; =
line-height: 1.6;"><span style=3D"font-size: 14px;"><span style=3D"font-fam=
ily: LarkHackSafariFont, LarkEmojiFont, LarkChineseQuote, -apple-system, Bl=
inkMacSystemFont, Tahoma, &quot;PingFang SC&quot;, Arial, sans-serif;"><spa=
n style=3D"color: rgb(31, 35, 41);"><span style=3D"background-color: rgb(25=
5, 255, 255);">While I tried with linux kernel-5.15, then the simulator </s=
pan></span></span></span><span style=3D"font-size: 14px;"><span style=3D"fo=
nt-family: LarkHackSafariFont, LarkEmojiFont, LarkChineseQuote, -apple-syst=
em, BlinkMacSystemFont, Tahoma, &quot;PingFang SC&quot;, Arial, sans-serif;=
"><span style=3D"color: rgb(31, 35, 41);"><span style=3D"background-color: =
rgb(255, 255, 255);">can</span></span></span></span><span style=3D"font-siz=
e: 14px;"><span style=3D"font-family: LarkHackSafariFont, LarkEmojiFont, La=
rkChineseQuote, -apple-system, BlinkMacSystemFont, Tahoma, &quot;PingFang S=
C&quot;, Arial, sans-serif;"><span style=3D"color: rgb(31, 35, 41);"><span =
style=3D"background-color: rgb(255, 255, 255);">&nbsp;be started properly.<=
/span></span></span></span></div><div data-zone-id=3D"0" data-line-index=3D=
"9" data-line=3D"true" style=3D"font-size: 14px; margin-top: 4px; margin-bo=
ttom: 4px; line-height: 1.6;"><span style=3D"font-size: 14px;"><span style=
=3D"font-family: LarkHackSafariFont, LarkEmojiFont, LarkChineseQuote, -appl=
e-system, BlinkMacSystemFont, Tahoma, &quot;PingFang SC&quot;, Arial, sans-=
serif;"><span style=3D"color: rgb(31, 35, 41);"><span style=3D"background-c=
olor: rgb(255, 255, 255);">For</span></span></span></span><span style=3D"fo=
nt-size: 14px;"><span style=3D"font-family: LarkHackSafariFont, LarkEmojiFo=
nt, LarkChineseQuote, -apple-system, BlinkMacSystemFont, Tahoma, &quot;Ping=
Fang SC&quot;, Arial, sans-serif;"><span style=3D"color: rgb(31, 35, 41);">=
<span style=3D"background-color: rgb(255, 255, 255);">&nbsp;the</span></spa=
n></span></span><span style=3D"font-size: 14px;"><span style=3D"font-family=
: LarkHackSafariFont, LarkEmojiFont, LarkChineseQuote, -apple-system, Blink=
MacSystemFont, Tahoma, &quot;PingFang SC&quot;, Arial, sans-serif;"><span s=
tyle=3D"color: rgb(31, 35, 41);"><span style=3D"background-color: rgb(255, =
255, 255);">&nbsp;kernel 6.3.8; kernel-5.10.130, the result is OK as well</=
span></span></span></span></div><div data-zone-id=3D"0" data-line-index=3D"=
10" data-line=3D"true" style=3D"font-size: 14px; margin-top: 4px; margin-bo=
ttom: 4px; line-height: 1.6;"><span style=3D"font-size: 14px;"><span style=
=3D"font-family: LarkHackSafariFont, LarkEmojiFont, LarkChineseQuote, -appl=
e-system, BlinkMacSystemFont, Tahoma, &quot;PingFang SC&quot;, Arial, sans-=
serif;"><span style=3D"color: rgb(31, 35, 41);"><span style=3D"background-c=
olor: rgb(255, 255, 255);">But there's no output info after the command exe=
cuted if the kernel before 4.19 is used.</span></span></span></span></div><=
div data-zone-id=3D"0" data-line-index=3D"11" data-line=3D"true" style=3D"f=
ont-size: 14px; margin-top: 4px; margin-bottom: 4px; line-height: 1.6;"><sp=
an style=3D"font-size: 14px;"><span style=3D"font-family: LarkHackSafariFon=
t, LarkEmojiFont, LarkChineseQuote, -apple-system, BlinkMacSystemFont, Taho=
ma, &quot;PingFang SC&quot;, Arial, sans-serif;"><span style=3D"color: rgb(=
31, 35, 41);"><span style=3D"background-color: rgb(255, 255, 255);">Is ther=
e any problem when early linux kernel (before 4.19) is used for qemu tools =
?</span></span></span></span></div><div data-zone-id=3D"0" data-line-index=
=3D"12" data-line=3D"true" style=3D"font-size: 14px; margin-top: 4px; margi=
n-bottom: 4px; line-height: 1.6;"><span style=3D"font-size: 14px;"><span st=
yle=3D"font-family: LarkHackSafariFont, LarkEmojiFont, LarkChineseQuote, -a=
pple-system, BlinkMacSystemFont, Tahoma, &quot;PingFang SC&quot;, Arial, sa=
ns-serif;"><span style=3D"color: rgb(31, 35, 41);"><span style=3D"backgroun=
d-color: rgb(255, 255, 255);">Thank you so much.</span></span></span></span=
></div><div data-zone-id=3D"0" data-line-index=3D"13" data-line=3D"true" st=
yle=3D"font-size: 14px; margin-top: 4px; margin-bottom: 4px; line-height: 1=
.6;"><br></div><div data-zone-id=3D"0" data-line-index=3D"14" data-line=3D"=
true" style=3D"font-size: 14px; margin-top: 4px; margin-bottom: 4px; line-h=
eight: 1.6;"><span style=3D"font-size: 14px;"><span style=3D"font-family: L=
arkHackSafariFont, LarkEmojiFont, LarkChineseQuote, -apple-system, BlinkMac=
SystemFont, Tahoma, &quot;PingFang SC&quot;, Arial, sans-serif;"><span styl=
e=3D"color: rgb(31, 35, 41);"><span style=3D"background-color: rgb(255, 255=
, 255);">BestRegards,</span></span></span></span></div><div data-zone-id=3D=
"0" data-line-index=3D"15" data-line=3D"true" style=3D"font-size: 14px; mar=
gin-top: 4px; margin-bottom: 4px; line-height: 1.6;"><span style=3D"font-si=
ze: 14px;"><span style=3D"font-family: LarkHackSafariFont, LarkEmojiFont, L=
arkChineseQuote, -apple-system, BlinkMacSystemFont, Tahoma, &quot;PingFang =
SC&quot;, Arial, sans-serif;"><span style=3D"color: rgb(31, 35, 41);"><span=
 style=3D"background-color: rgb(255, 255, 255);">Rex&nbsp;</span></span></s=
pan></span></div></div>
--bfa2fb542e7323460e7575b0de93ad2b4ebe872ff96219d724d6a1e8549a--
