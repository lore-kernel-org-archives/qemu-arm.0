Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1236407ejb;
        Thu, 3 Aug 2023 11:37:55 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF2BkX9dh6n1SiF2JO3X1e0kObykkPMRaAwK+ncmIuxp2SzeXDzHv9qcAGNVbEhnA69RCcW
X-Received: by 2002:a05:620a:4610:b0:768:a183:a8e2 with SMTP id br16-20020a05620a461000b00768a183a8e2mr22588868qkb.50.1691087875708;
        Thu, 03 Aug 2023 11:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691087875; cv=none;
        d=google.com; s=arc-20160816;
        b=K0I+k3ZWFQvEs5S48KNRIqIHIl8FCosyktWqh3I4T4N2h8Az3vH+14jMxBFeAdiVhr
         IF/MWNrWNXbRRnp8JMoIzuIZCYGHl3lZbGIwj3B+58s446YBdg9CbnENETsk03jN7qD3
         H04JzSYTCERk2XYM6qrmy/p/10kjYHIUmVs3Nw+7HQ2lDEnhLJBsP/SS6pPAxkDIyNU1
         cBrQ2om7P/76dzFFLMMyW9P5OV6ighuMg3XKonYD6UnlUoFI6b2u9WwaR7TCKXovSDfL
         Z8Yk+l31+/Ve8zmpnmIKHUgn6f9r+ICp6yrEf9ASRs+fj0r1jWCN5r2MAtMRn0nuPlQJ
         XKEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:dkim-signature;
        bh=Bgm5JqrH75mKYSc5ji+8sY1ItzPz6vEuLzqHE6eDm84=;
        fh=KpeOTtFnvNs35VYefDUEx5JarMLzhb7U+GdSBB9WUbI=;
        b=R1n4HnpPa71SCwCk8iQ+nPW6QbDbj9eruvZ89spkMkJPWcuoE4hcUznECXZbzZV7yj
         BWXqubOCd6GH7D74hdibq9SpHpIlZKOrTfKcm4t5y+1XNlDSPymmLXa+rCKea/p4+uN/
         uStkAHi0ZZyARkCN9lHMlB8nZTa7HR+x7m+FO9tg3vXkUlHpQhVg3Afv0Vy2cvIeRoa1
         AJCa30S/K+4w8okW/7IRaGqOjl41JQ6c2PmPhN6TGAC1PCePHJKaL2JWoix/4C7tl/Aa
         mLa7jqla1cyy6wzmPfGLkqbG6UIwWIdzysG8Tc9kWGpho/dMwRN3D2exORbw+qLAECx2
         yCMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=BQYNLFJD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id su12-20020a05620a4b4c00b0076cb8552663si179295qkn.8.2023.08.03.11.37.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Aug 2023 11:37:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=BQYNLFJD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRdCe-0002qZ-QG; Thu, 03 Aug 2023 14:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_chadk@quicinc.com>)
 id 1qRdCd-0002qQ-SV
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 14:37:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_chadk@quicinc.com>)
 id 1qRdCc-0003dI-7f
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 14:37:39 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 373ChJEB030279; Thu, 3 Aug 2023 18:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=Bgm5JqrH75mKYSc5ji+8sY1ItzPz6vEuLzqHE6eDm84=;
 b=BQYNLFJDPN975AUrHTH/iHCYo/MHPx8nstShgB1RsZZy38mZ/hh10TChiguKZTwoDa6s
 k6/OTmeH3FkaPInodNk1QSJSucKM5bXit/JpGyNWBkxwkjsJX94HylSl9sKMCbTTvdWh
 vpeZDQkDrPglfQpCBWXJ2hSWUq++OrAD8PhCog8uLJ1sm7yQaMHuzVE3mKn0Bs132Y8E
 +m8kGUyTqTnR5isjtDXXlWLWjLDctAXwzeIs1T8fAjPkEsbftQVQVw90cr3DtoBVlXR3
 HnrQHHcxytm++AC100WezFAGuurp8ThFOPxBVEHQTELlsMGzp0rWmY/WKJGUh9BrxFh3 og== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s87jhhnyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Aug 2023 18:37:35 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 373IbYqa029614
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 3 Aug 2023 18:37:34 GMT
Received: from nasanex01a.na.qualcomm.com (10.52.223.231) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 3 Aug 2023 11:37:34 -0700
Received: from nasanex01a.na.qualcomm.com ([fe80::482d:250d:70b6:e1c5]) by
 nasanex01a.na.qualcomm.com ([fe80::482d:250d:70b6:e1c5%12]) with mapi id
 15.02.1118.030; Thu, 3 Aug 2023 11:37:34 -0700
From: "Chad Karaginides (QUIC)" <quic_chadk@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: RE: ARM64 EL3 Exception SP_EL3 Issue?
Thread-Topic: ARM64 EL3 Exception SP_EL3 Issue?
Thread-Index: AdnFdhwK+23wUfZ8QmKETJsE742LSwAsvZuAAAQQK/A=
Date: Thu, 3 Aug 2023 18:37:34 +0000
Message-ID: <94554a5ed33c411d9b0cf3c57add903e@quicinc.com>
References: <6b1211f5bb004b12a57c142b54fa82a3@quicinc.com>
 <CAFEAcA_H8L6s6390YGJBtkyu-_D42U_KTbfJQ1+LSjQmZrRCTA@mail.gmail.com>
In-Reply-To: <CAFEAcA_H8L6s6390YGJBtkyu-_D42U_KTbfJQ1+LSjQmZrRCTA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.110.73.189]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 0W_dXPulBode5j50Htq5q8fZg90HWy__
X-Proofpoint-ORIG-GUID: 0W_dXPulBode5j50Htq5q8fZg90HWy__
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_19,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=921 spamscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308030167
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_chadk@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ECFF3C/8aSUk

U29ycnkgUGV0ZXIgeW91IGFyZSByaWdodC4gIEknbSBub3Qgc3VyZSB3aHkgSSB0aG91Z2h0IEkg
c2F3IGRpZmZlcmVudCBiZWhhdmlvciBvbiBhIHJlYWwgdGFyZ2V0LiAgUGxlYXNlIGRpc3JlZ2Fy
ZCBteSBlbWFpbC4gIFRoYW5rIHlvdSBmb3IgdGhlIHF1aWNrIHJlcGx5Lg0KDQpUYWtlIGNhcmUs
DQpDaGFkDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBQZXRlciBNYXlkZWxs
IDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+IA0KU2VudDogVGh1cnNkYXksIEF1Z3VzdCAzLCAy
MDIzIDI6MzkgQU0NClRvOiBDaGFkIEthcmFnaW5pZGVzIChRVUlDKSA8cXVpY19jaGFka0BxdWlj
aW5jLmNvbT4NCkNjOiBxZW11LWFybUBub25nbnUub3JnDQpTdWJqZWN0OiBSZTogQVJNNjQgRUwz
IEV4Y2VwdGlvbiBTUF9FTDMgSXNzdWU/DQoNCk9uIFdlZCwgMiBBdWcgMjAyMyBhdCAyMTowNCwg
Q2hhZCBLYXJhZ2luaWRlcyAoUVVJQykgPHF1aWNfY2hhZGtAcXVpY2luYy5jb20+IHdyb3RlOg0K
Pg0KPiBIZWxsbywNCj4NCj4NCj4NCj4gSSBhbSBleGVjdXRpbmcgdGhlIFplcGh5ciBSVE9TIG9u
IGEgUUVNVSBBNTMgY29yZSB3aXRoIFRyYWNlMzIgYXMgdGhlIGZyb250ZW5kLiAgSSBhbSBzZWVp
bmcgYSBiZWhhdmlvciBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIFFFTVUgQTUzIGNvcmUgYW5kIHJl
YWwgaGFyZHdhcmUuICBFeGVjdXRpb24gaXMgaW4gRUwxaCBhbmQgYW4gU01DIGNhbGwgaXMgbWFk
ZS4gIEV4ZWN1dGlvbiB0cmFuc2l0aW9ucyB0byBFTDNoIGJ1dCB0aGUgRUwxIHN0YWNrIHBvaW50
ZXIgaXMgbm90IHByb3BhZ2F0ZWQgdG8gU1BfRUwzLiAgSXMgdGhpcyBhIHBvdGVudGlhbCBidWcg
b3IgaXMgdGhpcyBmdW5jdGlvbmFsaXR5IGNvdmVyZWQgaW4gYSB0ZXN0IGNhc2Ugc29tZXdoZXJl
PyAgSWYgaXQgaXMgYSBidWcgSSBoYXZlIG5vIHByb2JsZW0gZGl2aW5nIGluIGFuZCB0cnlpbmcg
dG8gaGVscCBmaXggaXQuICBJIGFtIG5ldyB0byBRRU1VIGJ1dCB3aWxsaW5nIHRvIGhlbHAuICBK
dXN0IHdhbnRlZCB0byBtYWtlIHN1cmUgSSBhbSBub3QgZG9pbmcgc29tZXRoaW5nIHdyb25nIGZp
cnN0Lg0KDQpXaHkgZG8geW91IGV4cGVjdCBFTDMgdG8gZXhlY3V0ZSB3aXRoIEVMMSdzIHN0YWNr
IHBvaW50ZXI/DQpPbiBlbnRyeSB0byBFTDMgdGhlIENQVSBzaG91bGQgdXNlIHRoZSBTUF9FTDMg
KHdoaWNoIEVMMyBoYXMgc2V0IHVwIGJlZm9yZSBpdCBkcm9wcGVkIGRvd24gdG8gRUwyIG9yIEVM
MSkuDQoNCnRoYW5rcw0KLS0gUE1NDQo=
