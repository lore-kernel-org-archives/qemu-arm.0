Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp12222wrs;
        Thu, 15 Aug 2019 13:22:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRmOxgxqedYTv1umSmL6wUVHF5tg/q7NJ3tH/uC7hegLjaEa0e5RnpZWseOnn2IQUJ1V+e
X-Received: by 2002:a17:906:4d8d:: with SMTP id s13mr6009244eju.86.1565900550039;
        Thu, 15 Aug 2019 13:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565900550; cv=none;
        d=google.com; s=arc-20160816;
        b=O9Ef0F6d8ydwZb8x3RVXDNs3YDKNhjRVLVqIp4EJG2u+ZYH2u/ISScbA2Kn8DpMAIk
         3534smvgojPijU5kcr8XJVuuBAfLnHKCtAu8BsRZ+LgHNhPb1evbQXwufPSATos5yliF
         M0u/CpNKdGynlowjY1OA4+DIQE1GpZha2RvOK+NHZNw/T7wg01hXfaYVxxnmCvPXKbtF
         9lWYueyDtgDiOpRkpxtm9UUUFkwbuwU42g1FIf7YOqlVFsKoREXxa466UNDUfb0cty5S
         wfJNbxt/5uKCWUcWljA8UeIeXIMbkV3t5KgYMUPJkMX6kFC7rP45WTrekMlKF+ops+M/
         08/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from;
        bh=2rlgRFiOcPKWIYaQv3qtHmjCR0eRR1PEpmnaiRnSZl4=;
        b=mTtIndTKrDgNPmLsG8CKjFwnSi3mnMJVhaNmmAiR0qiDQ4nZy9nRGS7q+eA9Kfqo56
         Zd/A6w0sEJKgJ67kba1UNLHUZNHjqAu4f+sUWwhmzh3dEOFtVPf4Cpq1OApeKzg12AFo
         xUtDu3x3BI9xilnoLP/pnsPCYr+He1uWSvqizfQnWitkReXaQ87WNnMKRENod0nuAgSu
         0AVduPqhWt3JbEKfU/t18ATnmMrv4loah8EqrANU77vNXstZx64pOQULzwoJg4qeZE2x
         ijxr2v5loYMfvLZHHb/qmYgg0ookZXfHrzMmrR/TZ4UBUrmZbqoj0dzplV8aPuiuNWKe
         2a+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8si1940832ejg.193.2019.08.15.13.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Aug 2019 13:22:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:46850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyMGT-0002N8-4E
	for alex.bennee@linaro.org; Thu, 15 Aug 2019 16:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51284)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eajames@linux.ibm.com>) id 1hyMGJ-0002Ik-NC
 for qemu-arm@nongnu.org; Thu, 15 Aug 2019 16:22:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eajames@linux.ibm.com>) id 1hyMGH-0003H7-El
 for qemu-arm@nongnu.org; Thu, 15 Aug 2019 16:22:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37226
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eajames@linux.ibm.com>)
 id 1hyMGC-0003CG-H2; Thu, 15 Aug 2019 16:22:12 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7FKHRG3095390; Thu, 15 Aug 2019 16:21:54 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uda2vtkef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Aug 2019 16:21:54 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7FKHhUO007503;
 Thu, 15 Aug 2019 20:21:53 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 2u9nj65hbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Aug 2019 20:21:52 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7FKLq1c54657348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2019 20:21:52 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BB38136053;
 Thu, 15 Aug 2019 20:21:52 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4935F13604F;
 Thu, 15 Aug 2019 20:21:51 +0000 (GMT)
Received: from [9.85.177.247] (unknown [9.85.177.247])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 15 Aug 2019 20:21:51 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <1565814456-1264-1-git-send-email-eajames@linux.ibm.com>
 <ca560d31-25ca-5d48-a16a-4fdf74f4779b@kaod.org>
 <24e21dd0-55b8-a5df-57da-2d68bee204a0@linux.ibm.com>
Message-ID: <cb2d52b2-65ef-41d6-0e3f-6aefb78f4d34@linux.ibm.com>
Date: Thu, 15 Aug 2019 15:21:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <24e21dd0-55b8-a5df-57da-2d68bee204a0@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-15_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=659 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908150192
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by mx0b-001b2d01.pphosted.com id
 x7FKHRG3095390
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-arm] [RFC v2] hw/sd/aspeed_sdhci: New device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: andrew@aj.id.au, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7k6weD6xSlKa

DQpPbiA4LzE1LzE5IDM6MTMgUE0sIEVkZGllIEphbWVzIHdyb3RlOg0KPg0KPiBPbiA4LzE1
LzE5IDM6MDUgQU0sIEPDqWRyaWMgTGUgR29hdGVyIHdyb3RlOg0KPj4gSGVsbG8gRWRkaWUs
DQo+Pg0KPj4gT24gMTQvMDgvMjAxOSAyMjoyNywgRWRkaWUgSmFtZXMgd3JvdGU6DQo+Pj4N
Cj4+PiArwqDCoMKgwqDCoMKgwqAgc2RoY2ktPnNsb3RzWzBdLmNhcGFyZWcgPSAodWludDY0
X3QpKHVpbnQzMl90KXZhbDsNCj4+PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+Pj4gK8Kg
wqDCoCBjYXNlIEFTUEVFRF9TREhDSV9TRElPXzE0ODoNCj4+PiArwqDCoMKgwqDCoMKgwqAg
c2RoY2ktPnNsb3RzWzBdLm1heGN1cnIgPSAodWludDY0X3QpKHVpbnQzMl90KXZhbDsNCj4+
PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+Pj4gK8KgwqDCoCBjYXNlIEFTUEVFRF9TREhD
SV9TRElPXzI0MDoNCj4+PiArwqDCoMKgwqDCoMKgwqAgc2RoY2ktPnNsb3RzWzFdLmNhcGFy
ZWcgPSAodWludDY0X3QpKHVpbnQzMl90KXZhbDsNCj4+PiArwqDCoMKgwqDCoMKgwqAgYnJl
YWs7DQo+Pj4gK8KgwqDCoCBjYXNlIEFTUEVFRF9TREhDSV9TRElPXzI0ODoNCj4+PiArwqDC
oMKgwqDCoMKgwqAgc2RoY2ktPnNsb3RzWzFdLm1heGN1cnIgPSAodWludDY0X3QpKHVpbnQz
Ml90KXZhbDsNCj4+PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+PiBJIHRoaW5rIHRoZXNl
IHJlZ3MgYXJlIHJlYWRvbmx5Lg0KPg0KPg0KPiBXZWxsIHRoZSBhY3R1YWwgcmVncyBhdCBz
bG90ICsgMHg0MC8weDQ4IGFyZSBpbmRlZWQsIGJ1dCBub3QgdGhlIA0KPiBBc3BlZWQtc3Bl
Y2lmaWMgb25lcyB0aGF0IG1pcnJvciB0aGVyZS4gSSB0aGluayB0aGUgaWRlYSBpcyB0aGF0
IA0KPiBBc3BlZWQtc3BlY2lmaWMgY29kZSBjYW4gc2V0IGl0J3MgY2FwYWJpbGl0aWVzIGRp
ZmZlcmVudGx5IGlmIGRlc2lyZWQuIA0KPiBUaGlzIG1heSBwcmV2ZW50IHRoZSB1c2Ugb2Yg
YWxpYXMgcmVnaW9ucyBoZXJlLg0KDQoNCkFjdHVhbGx5IEkgY291bGQgYmUgd3JvbmcgYWZ0
ZXIgcmVhZGluZyB0aGUgc3BlY3MgYWdhaW4uIEl0J3MgYSBsaXR0bGUgDQpjb25mdXNpbmcu
IEknbSBmaW5lIHdpdGggbWFraW5nIGl0IHJlYWQtb25seSBhbnl3YXksIEkgZG91YnQgdGhl
cmUgd2lsbCANCmJlIGFueSBjb2RlIHRoYXQgbmVlZHMgdG8gd3JpdGUgaXQuDQoNCg0KPg0K
Pg0KPj4NCj4+PiArwqDCoMKgIGRlZmF1bHQ6DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChh
ZGRyIDwgQVNQRUVEX1NESENJX1JFR19TSVpFKSB7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc2RoY2ktPnJlZ3NbVE9fUkVHKGFkZHIpXSA9ICh1aW50MzJfdCl2YWw7DQo+Pj4g
K8KgwqDCoMKgwqDCoMKgIH0NCj4+PiArwqDCoMKgIH0NCj4+PiArfQ0KPj4+ICsNCj4+PiAr
c3RhdGljIGNvbnN0IE1lbW9yeVJlZ2lvbk9wcyBhc3BlZWRfc2RoY2lfb3BzID0gew0KPj4+
ICvCoMKgwqAgLnJlYWQgPSBhc3BlZWRfc2RoY2lfcmVhZCwNCj4+PiArwqDCoMKgIC53cml0
ZSA9IGFzcGVlZF9zZGhjaV93cml0ZSwNCj4+PiArwqDCoMKgIC5lbmRpYW5uZXNzID0gREVW
SUNFX05BVElWRV9FTkRJQU4sDQo+Pj4gK8KgwqDCoCAudmFsaWQubWluX2FjY2Vzc19zaXpl
ID0gNCwgDQo=
