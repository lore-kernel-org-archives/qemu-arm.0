Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp370408ejc;
        Wed, 23 Aug 2023 18:12:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk5mQttY8PMr9DurRafsVlppP0QuV53oOlpisxSrh2jccblpy+PioquEV6UD5ImCrTrZfg
X-Received: by 2002:a05:622a:24e:b0:403:cd14:8f with SMTP id c14-20020a05622a024e00b00403cd14008fmr18540197qtx.57.1692839540423;
        Wed, 23 Aug 2023 18:12:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692839540; cv=none;
        d=google.com; s=arc-20160816;
        b=gT9LeoLTSmgnwSRbA1IHYloCAALM6aNTgd8FbdanCoP0lDBOUcCR4vDDWm5/ogjJvf
         BIq7oXKFUcPcS90oFR9mjUeXSBNV3lwka2p84z0yW35ooep/1ZpCpqafEwpCs33/W4cP
         AC26qrhxrqlU4CcXfoZqSPYW+48KZJ+bD2xD4x+WBBpdG7oflkSAkC+tMylVeHfqgUNN
         5S3gBExSMRtJEBierWe92xI6CjrlvvLhyoi78AwqywIYL8mwhi51mCT7zn/YlB8twBvO
         Tm2yyhBLkopn6aWWkqFJp0FrKvrsVbBbLvVdS86vI1IZUp/EVW6Y0Ya4FnbmAmdAgi1W
         c08Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:mime-version
         :references:subject:cc:to:from:date;
        bh=L2akm400KYejIPZds6f9PdyQdIZgMmSw/2csrCKzKkg=;
        fh=/Ja1wSk8TMPYCYbZ4iI6eLv9PP592kvLmacDUyo47/w=;
        b=MBtdSB210rpMRL8rzqPfPhMSlruZrsfMRdQAIR7Kw3/bo7NLv+hMA+0hrjPGvv2voe
         MnqIbizHYMS6NdIbFcgXCsYFEjQmt8I+CgPq6MvDFRqlQ/RoDHBsSYeDRy3sJFaZ7AjO
         aoe2MwCn8igsmA8TRqtEoog/o4Csu45Psz7i6jilRgehvHcqXfZt41fp5HfGJSWcnHjx
         ddD35ADPOREZBYC/A8ONG6PB70rNFWgsXK90fXfYMVT5DehJcfYuGGrL+pylLmhLCHtg
         Rb1CgGcILRytAAZtrsY/1p2K1vtPvkclp+5Y8Aje4Vgbc8kG4CzFqm/5O+F2R4126u/9
         dLKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20-20020ac84e54000000b0040fdf952148si3033011qtw.39.2023.08.23.18.12.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Aug 2023 18:12:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYytO-0003zu-7s; Wed, 23 Aug 2023 21:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1qYytN-0003zd-1M
 for qemu-arm@nongnu.org; Wed, 23 Aug 2023 21:12:09 -0400
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>) id 1qYytI-0002IR-9v
 for qemu-arm@nongnu.org; Wed, 23 Aug 2023 21:12:08 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwCXnipUruZkZI4RAA--.3907S2;
 Thu, 24 Aug 2023 09:11:48 +0800 (CST)
Received: from WYQ-S (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwDnBiRPruZkYEIAAA--.201S3;
 Thu, 24 Aug 2023 09:11:44 +0800 (CST)
Date: Thu, 24 Aug 2023 09:11:46 +0800
From: "Yuquan Wang" <wangyuquan1236@phytium.com.cn>
To: "gregory.price@memverge.com" <gregory.price@memverge.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
 jonathan.cameron <jonathan.cameron@huawei.com>
Subject: Re: CXL Namespaces of ACPI disappearing in Qemu demo
References: <2023082215220191352877@phytium.com.cn>, 
 <ZOZho3SyqASo9MPD@memverge.com>
X-Priority: 3
X-GUID: 86EBC99C-EDBF-4CCA-8FC8-72BFBA88910C
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.228[cn]
Mime-Version: 1.0
Message-ID: <20230824091144726643114@phytium.com.cn>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart745241302416_=----"
X-CM-TRANSID: AQAAfwDnBiRPruZkYEIAAA--.201S3
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQABAWTmWioAbQABsf
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU8nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
 nUUI43ZEXa7xR_UUUUUUUUU==
Received-SPF: pass client-ip=162.243.164.118;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=zg8tmtyylji0my4xnjqumte4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_KAM_HTML_FONT_INVALID=0.01 autolearn=ham autolearn_force=no
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
X-TUID: yWeGua3+C0LW

This is a multi-part message in MIME format.

------=_001_NextPart745241302416_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

SGksIEdyZWdvcnkNCk9uIDIwMjMtMDgtMjQgMDM6NDQsICBHcmVnb3J5IHdyb3RlOg0KDQpJbiBy
ZWdhcmRzIHRvIHJlYWwgaGFyZHdhcmUsIEknbSBob25lc3RseSBub3Qga25vd2xlZGdhYmxlIGVu
b3VnaCBhYm91dA0KQUNQSSBvciBoYXJkd2FyZSB0byBwcm92aWRlIGFuIGludGVsbGlnaWJsZSBh
bnN3ZXIgdW5mb3J0dW5hdGVseS4NCg0KTmV2ZXIgbWluZC4gDQoNCllvdXIgcHJlY2lvdXMgZ3Vp
ZGFuY2UgYW5kIHJlcGxpZXMgYWxvbmcgd2l0aCBKb25hdGhhbidzIGFyZSBtZWFuaW5nZnVsIGZv
ciBtZSwgYmVjYXVzZSBJIHdhcyANCmp1c3QgdG91Y2hpbmcgQ1hMIGZpZWxkIGluIHdvcmsgYXMg
YSBmcmVzaCBncmFkdWF0ZS4NCg0KTWFueSB0aGFua3MNCll1cXVhbg0K

------=_001_NextPart745241302416_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }body { font-size: 13px; font-fami=
ly: "Times New Roman"; color: rgb(0, 0, 0); line-height: 1.5; }</style></h=
ead><body>=0A =0A<div>Hi, G<span style=3D"background-color: transparent;">=
regory</span></div>=0AOn&nbsp;2023-08-24&nbsp;03:44,&nbsp; G<span>regory</=
span>&nbsp;wrote:<div><table width=3D"100%"><tbody><tr><td width=3D"100%">=
<blockquote style=3D"BORDER-LEFT: #000000 2px solid; MARGIN-LEFT: 5px; MAR=
GIN-RIGHT: 0px; PADDING-LEFT: 5px; PADDING-RIGHT: 0px"><div><br></div>=0A<=
div>In regards to real hardware, I'm honestly not knowledgable enough abou=
t</div>=0A<div>ACPI or hardware to provide an intelligible answer unfortun=
ately.</div><div><br></div>=0A</blockquote></td></tr></tbody></table></div=
><div><span style=3D"background-color: transparent;">Never mind.&nbsp;</sp=
an></div><div><br></div><div>Your precious guidance and replies along with=
 Jonathan's are meaningful for me, because I was&nbsp;</div><div>just touc=
hing CXL field in work as a fresh graduate.</div><div><br></div><div>Many =
thanks</div><div>Yuquan</div></body></html>
------=_001_NextPart745241302416_=------

