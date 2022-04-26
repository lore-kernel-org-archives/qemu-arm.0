Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp128117lfu;
        Tue, 26 Apr 2022 03:48:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwl8iElKsbY0kniLVo50f5WnI61dYZKJi/bxmtBkzCVZDalYazsyaxsdvt2r5tj+R2mha4O
X-Received: by 2002:ac8:65c5:0:b0:2f1:e813:6078 with SMTP id t5-20020ac865c5000000b002f1e8136078mr14819558qto.187.1650970121907;
        Tue, 26 Apr 2022 03:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650970121; cv=none;
        d=google.com; s=arc-20160816;
        b=hf69i+ge1mbF3erhD1WqKkRTHEWUr4oUTgRTCz0aNh2lwRaX1UjX9maZFQki8RUUym
         LYijHC8F9BNzdUb6k0JOuzKSpH/U6ihBfX7e0E3Uqxl71bnSO80BPCgM/RoLCVzLOzeT
         yWgVHxGi7Us1eRcZrAUNFCgnShSIrsI6/wPeE63wzBZLhRgdGvh3qMZNUIxHIXEcIN7q
         8QdGrxe9wOcn3AsHFSrcSDieDXDx+BoiwnFcB8DZ6eYnQ/qaQ4Shn3DXUeJ+uLCTaHsk
         NFMwmlj4E9Y1Cg2sWXe1igSN4rSgASLLU4qK4sQNRzSKQm/He3WnmkRhpESJxHS4yHZH
         qQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=J6n81LiQbVUb+2jPncX9JoxqXUY5tTS+u0DfWvsxClA=;
        b=IYnP9XxygvCBO1I9OM02DCbc9bKTt9DmJavdriV8dmpBnQpppTYE7hjyQHxKQKrHRA
         emAhwy/yJBnf1vvqHQY3JvRmjn37TSqra0Tkz5K2V17RdJ1TZh3jQH5ieh0ZfO1wIlAg
         qhE9APYysKDOTsM+Yrnzs3TEctbFcvzvna+6Qe/IakqC+yV/A2H7yp79ybi0a9XkLsTE
         5s1Xi3fVQqZV5hJGYaIdeH3bxIHPLcGQ9xVDQzn19/8wF/WtamlWamPX9Zd17lWVrQU2
         /zlZBRDsLP87UqXuGeVXOgH0MCuBXWrpcQI6j1qaq0lYFRZEC7VbtO5qmikFb6476bT8
         F+sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=TBPh5WWu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020ac85702000000b002f364de1ef4si1850225qtw.427.2022.04.26.03.48.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 03:48:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=TBPh5WWu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:49708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njIkL-0005xw-83
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 06:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1njIUN-0006Ls-It; Tue, 26 Apr 2022 06:32:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1njIUG-0007Vv-DA; Tue, 26 Apr 2022 06:32:11 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23Q8lkE7001159;
 Tue, 26 Apr 2022 10:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=J6n81LiQbVUb+2jPncX9JoxqXUY5tTS+u0DfWvsxClA=;
 b=TBPh5WWuuCUEJ0+LQ/NMuy3QayRcUzZPhRiXMUtSt23AL4aZ3pG/b7D8fhwi1e3Sc1D+
 uJG/s3tnkF5owwxzmuuz90LzYKiV0axKDJMHv5X9nJKJ2JfTpJ3i1h65jLq9AYRyRQzl
 oaWK4//n0W/Cx3fGc8d6xXY6WLbO2yt+mMW4SWz4FvU/5OjRntU9vzodrY1zqwfhrTtw
 ZENp5gPgbRYZ94C6Tnnyr7IPmzgisPFGaZU4ikVKULJgkzAAQ7+WHN11+FsFOiYpljiQ
 g29yHITNSJ8wH3HVRvrVQQnanNeMWtHb/qxkPjto2bNqkCFK3u2MkPEMavDkR0jlkaym Kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fpdhu9xb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 10:30:53 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23QAOLbS025883;
 Tue, 26 Apr 2022 10:30:52 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fpdhu9xam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 10:30:52 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23QAIR01025995;
 Tue, 26 Apr 2022 10:30:51 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 3fm93ah186-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 10:30:51 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23QAUoCo4719254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Apr 2022 10:30:50 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AF2D124083;
 Tue, 26 Apr 2022 10:30:50 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABB0E12407F;
 Tue, 26 Apr 2022 10:30:49 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 26 Apr 2022 10:30:49 +0000 (GMT)
Message-ID: <722c4788-baf2-7f11-8494-1021d6425a48@linux.ibm.com>
Date: Tue, 26 Apr 2022 06:30:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 05/26] tests: move libqtest.h back under qtest/
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-6-marcandre.lureau@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220426092715.3931705-6-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zd9vN3n2j2iQc8knQZuz2Zo8NEkD0IAH
X-Proofpoint-ORIG-GUID: Tc3xmCHftX__pdIFDWtE_IojRBtSw3cp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_02,2022-04-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=879 priorityscore=1501 bulkscore=0
 clxscore=1011 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204260066
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Li Zhijian <lizhijian@fujitsu.com>, Havard Skinnemoen <hskinnemoen@google.com>,
 Klaus Jensen <its@irrelevant.dk>, Su Hang <suhang16@mails.ucas.ac.cn>,
 Gerd Hoffmann <kraxel@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 Ani Sinha <ani@anisinha.ca>, Hannes Reinecke <hare@suse.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 "open list:IDE" <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Amit Shah <amit@kernel.org>, Michael Roth <michael.roth@amd.com>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Coiby Xu <Coiby.Xu@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 "open list:sPAPR \(pseries\)" <qemu-ppc@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pBan2/Yepdnz



On 4/26/22 05:26, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Since commit a2ce7dbd917 ("meson: convert tests/qtest to meson"),
> libqtest.h is under libqos/ directory, while libqtest.c is still in
> qtest/. Move back to its original location to avoid mixing with libqos/.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

