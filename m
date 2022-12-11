Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp2402502ejb;
        Sat, 10 Dec 2022 21:09:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7gvdN4O8p1tHo/zUt4pCciRz204+ccBY6v+17NYM1fvJDZNQWYzmydw93jB506DGox/56p
X-Received: by 2002:a05:622a:1f0d:b0:3a4:fa86:13d4 with SMTP id ca13-20020a05622a1f0d00b003a4fa8613d4mr15831340qtb.33.1670735343685;
        Sat, 10 Dec 2022 21:09:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670735343; cv=none;
        d=google.com; s=arc-20160816;
        b=E8SIQUuKUtG0lhOoOs+9vc1z/jjKpKVksxF5DndCjffA5cxm25w2TmYLslif0Fz54H
         FJ0KWQNIYEcHzyTdeHG+/NF4XhF4EIbDk3w/e2+De6q/DWHcWJutZLqQcUtPq2tD9pnn
         3XbMFuwVa2d/7QZoDo2BSvCeMd5gMaEomYm+sJx2XgbmVavuXRXJd+PyO9OE6WqHKix7
         z1Im9p6Y8ptvM8zWxb3jdWg+f6zKM1+o5I1wHMXaq7UgqTgskejcpOMIQrB+jGKZ6AUe
         V1tbc9TNQsJG6yBnPsVyxiNAUSV5A8kjFeeh9pki+jtehkixhW5U53ERdjYyk1Bqas5+
         u5Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date
         :content-transfer-encoding:mime-version:subject:to:from
         :dkim-signature;
        bh=uqb9Izuf5o2WaITYAhcN5kdXMNL1+UPZq9XuSrthWLI=;
        b=u0iMBY02BbjoWrvwUGKtiWzMwDEybmvAXN/LT7UmNvheLWz1fiZTZG+X8O2hpf469E
         DGBNPZvg8iXYtFuAlb76U/jjiwhS3ftsHN5TmCeK8TvErWfmAP3mWvdu09vG9c22kCyk
         jb24wV1H/pAVxnjkr0/5de8ts3sYgJM27cJEgOoxa44ye0zw3+AxCGSaDCoO92A0ejuz
         sQ9twYXI4/8wPo+nCLio02kBSKlb3OiVDNq7u0K9I4pjDsLq94MwIui/a9o67KqShvUj
         bXrcmXAXUmgBrQ0zP4EPdiZ8Zs/0azumyZ+5olzr4mARxvHkMVjplTz/Vitrhm7OnsdH
         p/aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@qq.com header.s=s201512 header.b=J7JtLrrV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=qq.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk28-20020a05620a1a1c00b006fef6145bc0si2722768qkb.355.2022.12.10.21.09.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 10 Dec 2022 21:09:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@qq.com header.s=s201512 header.b=J7JtLrrV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=qq.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p4EZw-0000q2-G8; Sun, 11 Dec 2022 00:08:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <1327776831@qq.com>) id 1p4EZu-0000pn-8i
 for qemu-arm@nongnu.org; Sun, 11 Dec 2022 00:08:43 -0500
Received: from out162-62-57-64.mail.qq.com ([162.62.57.64])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <1327776831@qq.com>) id 1p4EZq-0001Em-BB
 for qemu-arm@nongnu.org; Sun, 11 Dec 2022 00:08:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1670735310; bh=uqb9Izuf5o2WaITYAhcN5kdXMNL1+UPZq9XuSrthWLI=;
 h=From:To:Subject:Date;
 b=J7JtLrrVsQ9mqAhav3ePo958FUkBpeRgPDA1s291DcgYH9GdtCy7NX93vRiq0Q1Qe
 VgC7lrCsvd1RxIUJepSXTEAtZlLpXxdGIjU7tEYvhqVUj4YCYKunHVdCK4ekOPsEQw
 SL2vAFHFPoFQzlElyR7iCR+h974EQZsfPH3Vo/IM=
X-QQ-FEAT: 3C1WcPM5lQ76vPUq4Hjhc0Qm4zUCqJnX
X-QQ-SSF: 0000000000000010000000000000
X-QQ-XMAILINFO: MazKs+JD5rz7IZiEs1LnmpUXwIGtHnhbiXw+Ll16SDkbTOpxy0oLXVV0RZHvYC
 HcWi/pLeSFkAwrN9jYhC5FpIl02/7of1j7eCCrb5VcklJNDBN+xcwRk1VXmaUMXBYBwmIJBvy+m6q
 SFqOuO6IY7ff4fYpZXaSIG3SoCwrRIOIzwt4a4tk488L/I7BeqSEzVWJryWhqWYLk/Kd1qJg3JtbE
 K2t355VBP3J3FBTg9qtLoSCG5PspfVVRZsWRdv2w/AtDwSE6q8raeHOeZxcpw+WFiZgeaON8Z10B9
 5aCfKQPKDPhpXjmS+jJeSgQi0cELYR43g2rO380xeWHcqjkpcr6oJ0snL2JqOTcAytR9rJkXJUfly
 C/rHravTJUz/zqYmSVcgvcnMTsNTj50Nh8Ho3Hwdf6TupCY/pu1fEdxeYI0/iFvJiCzxSs1ph5XsD
 QyqBVYlxVPiNZQUT9t1Qx74JVUeqqvmYkSEO1sYqZM7CSHWwpN/nzmbI3KJjyj5+aw/1DkVimCcDe
 l0BxnNL9Aw0MOrgkV16CcvkmebEcdTTqjP+39j4FEUYuKnPFFsShnWM44gDzz8seB+OAs+0ogCN5C
 PEdR7bEiSOiuVqmMjV5vQauo5ml1H836+3ZLYYrZP9vqDg1TsDIx+Cpd3F2AaYfCbDASvl48t7+0x
 9OnKiFAvqIpRQjazE0GFMcxl+xwM/yTiW5O30RoV8VFmRN5dkMIUsYwRAQ7j8LVvo8z+FkpNPi+Kq
 gEg64r/jmMngsvitTfFoA+4JB7PQWJ49gh14ZHdTKVzbihEDboJjqPRdCP5aLsoeV6nIOcCbX2thH
 6O76LsSCazMlz2g4Oy4zVrNmoj+RFmqsWXORhcatDVTeo9jp/sAHWGZmTH10mC9xfinu50V7IZI51
 EiLPO3mS4KBcpQ0lNfdsrKfc68w9LpZ
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 113.200.174.71
X-QQ-STYLE: 
X-QQ-mid: webmail818t1670734872t6043799
From: "=?gb18030?B?c3B1cnM=?=" <1327776831@qq.com>
To: "=?gb18030?B?cWVtdS1hcm0=?=" <qemu-arm@nongnu.org>
Subject: How to modify QEMU to support pythium CPU
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_63956418_11B35B48_54DF45B7"
Content-Transfer-Encoding: 8Bit
Date: Sun, 11 Dec 2022 13:01:12 +0800
X-Priority: 3
Message-ID: <tencent_5B529B3ADB3D80E98D1FE683A9A2A0A1AD07@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
Received-SPF: pass client-ip=162.62.57.64; envelope-from=1327776831@qq.com;
 helo=out162-62-57-64.mail.qq.com
X-Spam_score_int: 67
X-Spam_score: 6.7
X-Spam_bar: ++++++
X-Spam_report: (6.7 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, FROM_EXCESS_BASE64=0.001,
 HELO_DYNAMIC_IPADDR=1.951, HTML_MESSAGE=0.001, MIME_CHARSET_FARAWAY=2.45,
 NO_FM_NAME_IP_HOSTN=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: reject
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
X-TUID: 4eR/Ic752wRC

This is a multi-part message in MIME format.

------=_NextPart_63956418_11B35B48_54DF45B7
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

RGVhciByZWFkZXJzOg0KDQoNCiZuYnNwOyAmbmJzcDtJIHdhbnQgdG8gbW9kaWZ5IFFFTVUg
dG8gc3VwcG9ydCBwaHl0aXVtIENQVS4gTm93IEkgaGF2ZSB0aGUgZGV2ZWxvcG1lbnQgbWFu
dWFsIG9mIHRoZSBwaHl0aXVtIENQVSwgYnV0IEkgYW0gbm90IGZhbWlsaWFyIHdpdGggUUVN
VS4gU28gSSB3YW50IHRvIGtub3cgdGhlIGFwcHJveGltYXRlIHN0ZXBzIGFuZCBkb2N1bWVu
dHMgaW52b2x2ZWQgd2hpY2ggY2FuIGhlbHAgbWUgY29tcGxldGUgdGhlJm5ic3A7IHRhc2su
IFRoYW5rIHlvdSB2ZXJ5IG11Y2guDQoNCkJsZXNzIHlvdaOh

------=_NextPart_63956418_11B35B48_54DF45B7
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj5EZWFyIHJlYWRlcnM6PC9kaXY+PGRpdj48YnI+PC9kaXY+
Jm5ic3A7ICZuYnNwO0kgd2FudCB0byBtb2RpZnkgUUVNVSB0byBzdXBwb3J0IHBoeXRpdW0g
Q1BVLiBOb3cgSSBoYXZlIHRoZSBkZXZlbG9wbWVudCBtYW51YWwgb2YgdGhlIHBoeXRpdW0g
Q1BVLCBidXQgSSBhbSBub3QgZmFtaWxpYXIgd2l0aCBRRU1VLiBTbyBJIHdhbnQgdG8ga25v
dyB0aGUgYXBwcm94aW1hdGUgc3RlcHMgYW5kIGRvY3VtZW50cyBpbnZvbHZlZCB3aGljaCBj
YW4gaGVscCBtZSBjb21wbGV0ZSB0aGUmbmJzcDsgdGFzay4gVGhhbmsgeW91IHZlcnkgbXVj
aC48ZGl2Pjxicj48L2Rpdj48ZGl2PkJsZXNzIHlvdaOhPC9kaXY+

------=_NextPart_63956418_11B35B48_54DF45B7--

