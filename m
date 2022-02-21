Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2734085lfq;
        Mon, 21 Feb 2022 05:40:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXV036XYDdALnvstlr85umfkicLqku7m9HSMlQRlXJ0PE440n2dUcepOFC9qNgtXSZS7b1
X-Received: by 2002:ac8:5dd4:0:b0:2d8:e1c5:6775 with SMTP id e20-20020ac85dd4000000b002d8e1c56775mr17592122qtx.1.1645450810099;
        Mon, 21 Feb 2022 05:40:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645450810; cv=none;
        d=google.com; s=arc-20160816;
        b=zJBxRooveRVZ+sh+smFvhXRsykuP/lDN5Gx4L4VEpqvIzm7guaN+W6cLUAm09ysBlK
         cgx/aVLFPJu6UuU9MdIXdlGr2r33nXzJYM90gpp0o3qZIopjI+JIynfJgNAh15xCuPng
         q7QqWe5VxQ6mv2vZONp/oQrShSsLRxqmOKXJD8fhIoo+GDF3S0ywiEzTYRZQM3RvgGxq
         NsXhdbxxjUhCC8B8i4mjNPvvCULO/NtO1fgHa/KVV9y8kiYkPOhJ/TfsCWA48NGVxV9b
         eHsVvr+/oEcH2caPpLkf0lKBRb0y0z5dZIWhC7PXWfG323r2cGlN8VxzygtF84NoD9aI
         aE9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=hgqn6mCKOdT/OqeGo4s8oTyquQ4KzkIIcOiEzC3LNf8=;
        b=MJ2zlchISnIYZyPRBa0pH/iD3Fl/QMUYo5AzVUQwzPpuBzhqfEoH6OiiW+ZLnQmogP
         lTOUySu8ksjnFTkmHxSEBJE7NISRLRP1G6rKAYkDDumTXHAUi6/cJOXH0CWjbTJo/7m1
         qJMnYzRQrMO6dFzdGQa7qKg7F/dZOSl1dAczR5LluylW1gtAa4cT9T0RhuusPcOchG1w
         4XsMNeQoBdUgIjYhP+TxL42C2GcLvj3dVqVAuN2bkvGNNWJxF50XKrYeM+NJUkvQBQ+A
         prtDqnxvhnmDvDJ5n75wPIV/96AQbbIEnc/sWokp1ylECGqroex33fzqGsycz59E9lmS
         RRaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Yvbc3xnl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l13si6298639qtx.622.2022.02.21.05.40.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Feb 2022 05:40:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Yvbc3xnl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nM8vB-0006rC-E0
	for alex.bennee@linaro.org; Mon, 21 Feb 2022 08:40:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM8lb-0006gp-0T
 for qemu-arm@nongnu.org; Mon, 21 Feb 2022 08:30:17 -0500
Received: from [2607:f8b0:4864:20::b33] (port=36421
 helo=mail-yb1-xb33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM8lY-0007HP-LB
 for qemu-arm@nongnu.org; Mon, 21 Feb 2022 08:30:13 -0500
Received: by mail-yb1-xb33.google.com with SMTP id c6so34376700ybk.3
 for <qemu-arm@nongnu.org>; Mon, 21 Feb 2022 05:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hgqn6mCKOdT/OqeGo4s8oTyquQ4KzkIIcOiEzC3LNf8=;
 b=Yvbc3xnlaN5TX8zqAuTtc+S4Zsn3687eH8+0lsyNbBK1k/AadtsnUJd8XrOi+XJUWD
 DCWvEST0otfOX76n+yQRoTBDP1MxZo86EEvkZDOgAAqybDDaXzEG4kwHx0nACz+ey/mF
 lqgL+mWAmRycOJ6eXb8F3xsxYAQnG8E+6JKdYsxHU9I0CEXk3H3/8bkWFCEBeFajl1C9
 jrC28hSxnXkwXNvidOSlMEqrdLox8X0gVZiftgAAKZhmLj0T13DeCOlsNpiMUBG5dv/V
 8PhhIogFMkshCc57FFkhG6rI5u/BMZe0Z532zAOY42tF57disprjU0r+XpoM27K8zeli
 VxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hgqn6mCKOdT/OqeGo4s8oTyquQ4KzkIIcOiEzC3LNf8=;
 b=ceHOFlYtHdOvEXN/zJ7dZ0dzXHeNKMeQsdehPioThj4Kb6oKVE5m95Cg6jGm8d7O7M
 iZXsVMVDbPfthh0asw4ppNUsvPGM1Luc1iGM75hx5MwAeU3zy5Y3ulcHbtmr00oBceF2
 gieWhRmw2f22hHMJeQhTLiE13SFE40OKIyUEM6uXxjfO5mxv60xXKvIc6t+gBclPfiOJ
 p689tqTksb6Wb/qKKz82gJ0hdXldYbqhUXuOHWeYEKwyS+diQeCGwFy8e2cNZ6XHsF6A
 fsVsSlyWOxtO70JLygWaH4VeUVH/QCPOhAtsLYBlzsKuX7gE28r48T0uTq0OzVJR438q
 S2mg==
X-Gm-Message-State: AOAM532+Se+zMch5z1Jlofyxw5/hcfEExuUetoDERN2KC18yZi/Kc3lg
 nopxds1tonSi10FAun932Vy/AKtlX1Y/QPeV7AY+3g==
X-Received: by 2002:a25:dc87:0:b0:624:4104:a331 with SMTP id
 y129-20020a25dc87000000b006244104a331mr15584447ybe.67.1645450209494; Mon, 21
 Feb 2022 05:30:09 -0800 (PST)
MIME-Version: 1.0
References: <20220208181843.4003568-1-venture@google.com>
 <CAFEAcA8m2yhtih_+XCOJPUzAwtLuF2exF+vaa1woC7bYoryVXA@mail.gmail.com>
In-Reply-To: <CAFEAcA8m2yhtih_+XCOJPUzAwtLuF2exF+vaa1woC7bYoryVXA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Feb 2022 13:29:58 +0000
Message-ID: <CAFEAcA_zfd=5bSMKwVbSk0LStcWcYxFosazhiGz0nb2z=upSHQ@mail.gmail.com>
Subject: Re: [PATCH v3] tests/qtest: add qtests for npcm7xx sdhci
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, Shengtan Mao <stmao@google.com>,
 qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, Chris Rauer <crauer@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KpKYBp33dCIm

T24gV2VkLCAxNiBGZWIgMjAyMiBhdCAxNzozMCwgUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVs
bEBsaW5hcm8ub3JnPiB3cm90ZToNCj4NCj4gT24gVHVlLCA4IEZlYiAyMDIyIGF0IDE4OjE4LCBQ
YXRyaWNrIFZlbnR1cmUgPHZlbnR1cmVAZ29vZ2xlLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBGcm9t
OiBTaGVuZ3RhbiBNYW8gPHN0bWFvQGdvb2dsZS5jb20+DQo+ID4NCj4gPiBSZXZpZXdlZC1ieTog
SGFvIFd1IDx3dWhhb3RzaEBnb29nbGUuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBDaHJpcyBSYXVl
ciA8Y3JhdWVyQGdvb2dsZS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2hlbmd0YW4gTWFvIDxz
dG1hb0Bnb29nbGUuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgVmVudHVyZSA8dmVu
dHVyZUBnb29nbGUuY29tPg0KPiA+IC0tLQ0KPg0KPg0KPg0KPiBBcHBsaWVkIHRvIHRhcmdldC1h
cm0ubmV4dCwgdGhhbmtzLg0KDQpUaGlzIGhpdHMgYXNzZXJ0aW9ucyBpbiBzb21lIG9mIHRoZSBD
SSBqb2JzLCBlZzoNCmh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2pvYnMv
MjExNjkzMjc2OQ0KDQoyNTgvNzE3IHFlbXU6cXRlc3QrcXRlc3QtYXJtIC8gcXRlc3QtYXJtL25w
Y203eHhfc2RoY2ktdGVzdCBJTlRFUlJVUFQNCjY0My4xNnMga2lsbGVkIGJ5IHNpZ25hbCA2IFNJ
R0FCUlQNCuKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAlSDinIAg4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCVDQpzdGRlcnI6DQoqKiBNZXNzYWdlOiAwNjowNjo1MC4yMDU6IC90bXAvc2RoY2lfRjdF
VEgxDQoqKg0KRVJST1I6Li4vdGVzdHMvcXRlc3QvbnBjbTd4eF9zZGhjaS10ZXN0LmM6MTAxOnNk
d3JpdGVfcmVhZDogYXNzZXJ0aW9uDQpmYWlsZWQ6ICghc3RyY21wKHJtc2csIG1zZykpDQrigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJUNCi4uLnRlcm1pbmF0ZWQuDQoNCnNvIEkndmUgZHJvcHBlZCBpdCBhZ2Fpbi4NCg0KdGhhbmtz
DQotLSBQTU0NCg==
