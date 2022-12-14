Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp421920ejb;
        Wed, 14 Dec 2022 05:11:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7gnEMA9QxSGZqM2rqzqtSJ9Ldc7aPuAPd5xybaJbChmQQRkQqPu7zdITh1b3EuvGA8erSU
X-Received: by 2002:a0c:fe49:0:b0:4c6:5908:84d4 with SMTP id u9-20020a0cfe49000000b004c6590884d4mr29833424qvs.3.1671023502490;
        Wed, 14 Dec 2022 05:11:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671023502; cv=none;
        d=google.com; s=arc-20160816;
        b=lla2EmWoYCRSEm3UzOMboJdIad5BFqfHeKej/XsrXxiJC0cKZ2FefkXuCN1jbSMs7A
         7Axp/16YH2aC6W+NONHK8fvvXyn8OuU8GZYf+SmpwzemLg9hCuD4ctsFNWvqEWCo288M
         OJ83O+seklVqp4/teyJNcOouTxS02bbOZBNErvapqKsmO9tn/tBvhOApuf6nBgdL06th
         WotUsRuFI786PzEDaxnu/g8iZJUzuOBRFGHdqg/Df/dyRUZx3rCyWvXLqVYGJlm/Rwt3
         1hWKUrzQP8Mq+7513UcsjlLxVws0JNgiHAUHtdOZP+q5Mj8b2YWG9hB5TgiwoTyxPWtA
         lYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:cms-type
         :content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:dkim-signature:dkim-filter;
        bh=XgGaGo3x2II6W5hso83OGl5XRsXaN+H9lCbarhO8oa0=;
        b=EOu/gWzwholzSvdIUPlRzqjWMd748pkolw8FwtnS2c6Ip9txDzduX4OlAlgIogEpHs
         U2TGzp6VKZuyOGkyPuTAykYNTL1dD1GXemLpGAVlJ4Xa7Vu0bdGCS5HzlZIdCzznyxKM
         XVmb8g4Rp5lNWEdS9qoxW4aefXrZ6p6JsQM4VX0lZ96I+VKcc2mp6ArtXdBi4iOJj84i
         6OWAmL4Gz7pcm6N03osRiKSPSqSKVxvp3lKpjDHfhgwJK4UdPbCDk0Zw9K+v9a9kGrk4
         jlOiCfaBfd94njfQKHH7gZTtfX/vbMuC1BK7PJFzxpSN5Upxygrcbti8XCNvwTGztqXd
         754g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@samsung.com header.s=mail20170921 header.b=aCPkxlh+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=samsung.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17-20020a056214029100b004c7075d814bsi8118712qvv.82.2022.12.14.05.11.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Dec 2022 05:11:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@samsung.com header.s=mail20170921 header.b=aCPkxlh+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=samsung.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p5RXS-0005xa-0C; Wed, 14 Dec 2022 08:11:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.kotrasinsk@samsung.com>)
 id 1p5RX9-0005s4-Vo
 for qemu-arm@nongnu.org; Wed, 14 Dec 2022 08:10:52 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.kotrasinsk@samsung.com>)
 id 1p5RX5-0000IB-6B
 for qemu-arm@nongnu.org; Wed, 14 Dec 2022 08:10:51 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221214131037euoutp02bfd0df0f2c59ac0e09d651e9fedd4ba3~wqvZyna2E2643026430euoutp02Z
 for <qemu-arm@nongnu.org>; Wed, 14 Dec 2022 13:10:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221214131037euoutp02bfd0df0f2c59ac0e09d651e9fedd4ba3~wqvZyna2E2643026430euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1671023437;
 bh=XgGaGo3x2II6W5hso83OGl5XRsXaN+H9lCbarhO8oa0=;
 h=Date:From:Subject:To:References:From;
 b=aCPkxlh+vvc/DEoTIqvVijJB9EN8SDrePG25lCnP1M47ZfZsQQ6B/++u1Jxto1nk9
 7CgOZVNdXsCJAREYZQqnULapBMwrtwLuEAYU8Tp2XNouVjtdsXPqxeRCaYZE/784+r
 l7UUkIOfNraefzEqSFFHDYaBJGQVLmoF/9p9qqew=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221214131037eucas1p1b24eed325e6bb2d26aec7f0fd72713b7~wqvZt4fo72292822928eucas1p12
 for <qemu-arm@nongnu.org>; Wed, 14 Dec 2022 13:10:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 44.18.09549.C4BC9936; Wed, 14
 Dec 2022 13:10:36 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221214131036eucas1p142325a5cae35a116406184b5d0731115~wqvZSWzLr2292422924eucas1p1D
 for <qemu-arm@nongnu.org>; Wed, 14 Dec 2022 13:10:36 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221214131036eusmtrp23d49b2e0bc8bf1a4f78fe99a3c8771ed~wqvZRydHi2829828298eusmtrp2-
 for <qemu-arm@nongnu.org>; Wed, 14 Dec 2022 13:10:36 +0000 (GMT)
X-AuditID: cbfec7f5-f47ff7000000254d-de-6399cb4c2117
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E8.B5.09026.C4BC9936; Wed, 14
 Dec 2022 13:10:36 +0000 (GMT)
Received: from [106.210.134.115] (unknown [106.210.134.115]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221214131036eusmtip29f8c4043036520bc8e74c19d48bf5238~wqvZFk6DO0401404014eusmtip2k
 for <qemu-arm@nongnu.org>; Wed, 14 Dec 2022 13:10:36 +0000 (GMT)
Message-ID: <e5232540-9c92-e16b-f8ca-207ee4a8516a@samsung.com>
Date: Wed, 14 Dec 2022 14:10:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
From: "Igor Kotrasinski/Security (PLT) /SRPOL/Engineer/Samsung Electronics"
 <i.kotrasinsk@samsung.com>
Subject: Question about Cortex-M exceptions and ES bit value
To: qemu-arm@nongnu.org
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRmVeSWpSXmKPExsWy7djPc7q+p2cmGxw5wGqxoHshmwOjx5Nr
 m5kCGKO4bFJSczLLUov07RK4MibNbWUtuMResfbmT8YGxkesXYycHBICJhJ7Jk9j7mLk4hAS
 WMEocXPOIkaQhJBAH5PErRfhEIleJoldex8yw3T8vDiTBSKxnFHi1/UuKKebSeLXzCtMIFW8
 AnYSl5dMBxvFIqAq8WJHHyNEXFDi5MwnLCC2qECyxLmzV9lAbDaBDInGdZvBNggL2Ejcm7gI
 aA4Hh4iAuMSGK6IgYWYgs+nLSlYIW15i+9s5YGdLCLxll5g96z4TxHUuEktbjjJC2MISr45v
 YYewZST+75wPVVMsseTsDhYIu0bifPdKqBpriV3Hu1lA9jILaEqs36UPEXaUePbnJCNIWEKA
 T+LGW0GIE/gkJm2bzgwR5pXoaBOCqFaTmPZrDzPM0mWNj1ggSjwkfk1whQRtrMTBWbeZJzAq
 zEIKkllIfpyF5MdZCOcsYGRZxSieWlqcm55abJyXWq5XnJhbXJqXrpecn7uJEZgaTv87/nUH
 44pXH/UOMTJxMB5ilOBgVhLhVdWYlizEm5JYWZValB9fVJqTWnyIUZqDRUmcd8WUjmQhgfTE
 ktTs1NSC1CKYLBMHp1QDU/fl85+udjUFb+C/f8qiaBaL97GjvPfSzwRLRu+azf/LLzr5xXxF
 34Ka3yYHK1ZlGtZ1uQoHXgjbcUc4Tqiv9M7td+cas5YkTeqcem7eWZddbmVHUpVbL6UsfuLw
 7pROxhd9+cu8WmtS2qqTFivsqugKKZssEilb1Wiynb3SrzywoXKvd0j051O/X9zqn5lysknv
 aZ+AwO61X+0XNh+YuvrgT5ZNLwKY9pdWZF9csOhp74YT2Sr5hUJRHjuevl0XvYnP/H3zQY66
 I09+Bj6w+8qp1nvN5BRP3N+7fHN9+yXXKdy82155vOVUzifRgOzXun+cbP75Gmwq6U1eE9mk
 2V/fKKtUv//ivJfvFVwrlFiKMxINtZiLihMBOt/XvnwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFLMWRmVeSWpSXmKPExsVy+t/xe7o+p2cmG6xco2KxoHshmwOjx5Nr
 m5kCGKP0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0
 MibNbWUtuMResfbmT8YGxkesXYycHBICJhI/L85k6WLk4hASWMooMefGJWaIhIzEj9Nr2CBs
 YYk/17rYIIo6mSTeXvgM1s0rYCdxecl0RhCbRUBV4sWOPkaIuKDEyZlPWEBsUYFkieYth5hA
 bDaBDInHG7vAhgoL2Ejcm7gIKM7BISIgLrHhiihImBnIbPqykhXCNpPo2trFCGHLS2x/O4d5
 AiP/LCQbZiFpmYWkZRaSlgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECA3nbsZ9bdjCu
 fPVR7xAjEwfjIUYJDmYlEV5VjWnJQrwpiZVVqUX58UWlOanFhxhNgd6cyCwlmpwPjKW8knhD
 MwNTQxMzSwNTSzNjJXFez4KORCGB9MSS1OzU1ILUIpg+Jg5OqQamSG51EavewpeJB86Ku267
 PdVBYot59qS8hSLqe35oSFjrbrrsEPH5fL6ry+bwE28vlHqmfwoMtz/EJZ34btaOkpgnyc2a
 /X21i6yuBums3XcggeGW/Cs1/lXFliIrRKuWLzr3ULGDY8qlD/9Eyn2m7zx7QX/yMl7D37OE
 Q7ge7FK29rgdNHvn7vm7X0hVZS0sbTrOq/U+60bD9fA/U+fvVl1tLMr1+M/8JAGb80eWFk5v
 bXLn7ONQZT+0Ut9/Tsq3RWuL1j3JubCioOpwR+Ds86r1TTmFN+R/tN+ZwXbYVsv9/Oqr1yRW
 ruj54Nb+bdfx8qyLeQmzU1S+5dzM+55os+TzI+b6QhUXhZrD16ZdV2Ipzkg01GIuKk4EABtF
 bcftAgAA
X-CMS-MailID: 20221214131036eucas1p142325a5cae35a116406184b5d0731115
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221214131036eucas1p142325a5cae35a116406184b5d0731115
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221214131036eucas1p142325a5cae35a116406184b5d0731115
References: <CGME20221214131036eucas1p142325a5cae35a116406184b5d0731115@eucas1p1.samsung.com>
Received-SPF: pass client-ip=210.118.77.12;
 envelope-from=i.kotrasinsk@samsung.com; helo=mailout2.w1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ZF7s9qNZDb5U

Hi,

I'm playing around with hacking in support for a custom Cortex-M board, 
and I noticed something strange in exception entry code. The 
av7m_exception_taken function has a bit like this:

 > if (arm_feature(env, ARM_FEATURE_V8)) {
 >     ...
 >     lr &= ~R_V7M_EXCRET_ES_MASK;
 >     if (targets_secure || !arm_feature(env, ARM_FEATURE_M_SECURITY)) {
 >         lr |= R_V7M_EXCRET_ES_MASK;
 >     }
 > }

Meaning that, if Cortex-M security extensions are NOT present, the ES 
bit is set. However, in the reference manual for Armv8-M the roughly 
equivalent ExceptionTaken() function does something like this:

 > assert(HaveSecurityExt() || !excIsSecure);
 > ...
 > if excIsSecure then
 >     LR<2> = CONTROL_S.SPSEL;
 >     LR<0> = '1';
 > else
 >     LR<2> = CONTROL_NS.SPSEL;
 >     LR<0> = '0';

That looks to me like the ES bit (LR<0>) should NOT be set if security 
extensions are NOT present. Am I correct, is it a bug?

Thanks,
Igor
