Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1327310lfy;
        Thu, 20 Aug 2020 05:54:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweT5nSOJsRPcuWMbxLU8n4TECc3GjhQmyJTOaudDiW0VxhIURIKU2WNXjiQNZOMBJktVW9
X-Received: by 2002:a25:dd84:: with SMTP id u126mr5206523ybg.269.1597928085088;
        Thu, 20 Aug 2020 05:54:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597928085; cv=pass;
        d=google.com; s=arc-20160816;
        b=krFJwe4+sUey/7tWikmNz36CGqADEbZcc+302yU9RpKY3BoEEm0u3QhUp7dGj26QuZ
         z8obk5wHyVtVcHQhciatM43gT37lpHcWCbzBBuFdNbR+yb7WqfeR5vZjRW+TOzf0gGN5
         uAv84jPsjriYn64MVyLw4hWSNC6+k0Uo1cicaenr0ztbEpZsdyJOitvoGsRl8LURMzpa
         U8C3+DBW4N1jTseP86kbh43dMcoLKFiys2zw1QGkKEQgk2XR4A7MECMYDqBB1fvcI9+g
         KlI6Jv6Jushnen4+x1ExCl+WOvupI/VVjskpTAMFqnKESOsKJj8N8pmUuJQaDs1VmzSK
         kuVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:content-language
         :in-reply-to:user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=3Rjdy3/iqjdBrz2bGTaK97gnqri0xxtHTzFx/3tKKCo=;
        b=UzfUqEoCnxu4D/SCXp0Igs3pOqqDaXgMve/p+X17Q90Dzyf8RK08OQZfH4av512XuN
         iVLx7+mMywPDCkK/TdpHkMV9sBw3gObjJF3w8Bj4EvXyNC4vvpuwEwG/NCOgZ7XJXwYL
         bYYi29Uq4f+aCFdDNzUOHADFfG9G6Tm6gEqbzppIVKn93VDrMWOFqe/Edw6uamPxlwrk
         gAMA3s2xIbMXNxZSHVpbg2oYY+JQUfKO/wIrZXtSUUoiI24MQtFic9ce3hPfip9WECEl
         4lVT2wJGzJg297JR0sn6VGcldWKDsqgf3nHD9cRqir/m24ERMriRs6OTa0hekdhqkdD2
         Vfbg==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=OrGrZSuq;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20si1913244ybj.55.2020.08.20.05.54.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Aug 2020 05:54:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=OrGrZSuq;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:46064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8k5c-0001Zz-Fi
	for alex.bennee@linaro.org; Thu, 20 Aug 2020 08:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <diana.craciun@oss.nxp.com>)
 id 1k8d6a-0005nD-MD
 for qemu-arm@nongnu.org; Thu, 20 Aug 2020 01:27:16 -0400
Received: from mail-eopbgr150072.outbound.protection.outlook.com
 ([40.107.15.72]:50486 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <diana.craciun@oss.nxp.com>)
 id 1k8d6Y-0000HK-Kc
 for qemu-arm@nongnu.org; Thu, 20 Aug 2020 01:27:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTZC6Y+uVxDXHA7+1iYRtWloKVgWPZiVUk9BRM18ft+ub2SGeVBrRgwTC6YxemLJtREZSZZmxWe+z9Acp/15O4URt7kmAFthoqWyceiFnKiiT7dOoa3mfPfjDC/7Teuk0FFcTGTPWNTiSG8j0s49A2MxTdhge4dWfvd5O0TIS2YQyuLSpPHXn4Xcm741nf9DjYGvBGZzccAjWd54LAaZ94rtPYq5IuKNX9REtPdGYB8+uOwJre9Rn7gTbRTgF8NkHNtLbtH83esFnPpWgrpULHRxGHq+RbB/HFxZKQmCOWXK+Axp6nQ6e2pQuA9a+T1EA33b9tv7xrvjKQya9yexkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Rjdy3/iqjdBrz2bGTaK97gnqri0xxtHTzFx/3tKKCo=;
 b=IEeAxsAQrgM1OpqER7Ya0iQSR7ageo6PhGtP8GaWH/gzAObitup2Dy3w0ZZcQW208+oX3JoME4u01Asd+0oSXzq5mJI8PCBq2yambHsMzxMJuiLt4AsZRtWLsq/EdqxKku23Emep9znh02Biq/1kidwBu8KoTf5hN01tXuEg/I71NwPLv5w6PxQ7vjb99KYIoVRzu9F/Mmu0VnmNh/IKzuD8xu+fnIvikT8XZCPyXYGilKHysK5nlm2ib6MOtGJaecR8PQOqB6u06ig7+KbUZ1qFvi9uhaoxnJ1mEr0jC08B67VC0NM5jPFgLnJUPViwKnChavb3Rw/b+dNcfBxylQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Rjdy3/iqjdBrz2bGTaK97gnqri0xxtHTzFx/3tKKCo=;
 b=OrGrZSuqlJITMu6qWu198glSC3EHpwbdU/xTtalDufF1gpUsbq3P1zP2rf0/fi7Fd+Kx6DbhV5ZCl5U5mdXi1npjPCDYKX6XJQQPBP+wKQVhHilpPnxpPIqoS0eQD4X7KpkUCpeSLJ6oXegWucNC4tkwDJoeSw0DBBv9/Yk2uqg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB2815.eurprd04.prod.outlook.com
 (2603:10a6:800:ae::16) by VI1PR04MB5871.eurprd04.prod.outlook.com
 (2603:10a6:803:ea::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Thu, 20 Aug
 2020 05:12:02 +0000
Received: from VI1PR0402MB2815.eurprd04.prod.outlook.com
 ([fe80::a508:19fb:5b7e:5607]) by VI1PR0402MB2815.eurprd04.prod.outlook.com
 ([fe80::a508:19fb:5b7e:5607%9]) with mapi id 15.20.3305.025; Thu, 20 Aug 2020
 05:12:02 +0000
Subject: Re: About QEMU FOR LS1046
To: Yutong Feng <yf1334@nyu.edu>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
References: <CABtOTBCqHdJFg6+1k+mec1Cb9RM3YFqQzMfKLKXP==H=_zNSjw@mail.gmail.com>
From: Diana Craciun OSS <diana.craciun@oss.nxp.com>
Message-ID: <650f329a-e530-b9ef-7291-8a1e1bcf4372@oss.nxp.com>
Date: Thu, 20 Aug 2020 08:12:02 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <CABtOTBCqHdJFg6+1k+mec1Cb9RM3YFqQzMfKLKXP==H=_zNSjw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------88057977D560F6A2772496A1"
Content-Language: en-US
X-ClientProxiedBy: VI1PR08CA0199.eurprd08.prod.outlook.com
 (2603:10a6:800:d2::29) To VI1PR0402MB2815.eurprd04.prod.outlook.com
 (2603:10a6:800:ae::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.122] (188.27.189.94) by
 VI1PR08CA0199.eurprd08.prod.outlook.com (2603:10a6:800:d2::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.25 via Frontend Transport; Thu, 20 Aug 2020 05:12:02 +0000
X-Originating-IP: [188.27.189.94]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5c2c361e-f232-47f1-09ce-08d844c792a8
X-MS-TrafficTypeDiagnostic: VI1PR04MB5871:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB58715B8067A629BBCC5ECE11BE5A0@VI1PR04MB5871.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LIRfBvDekRteTzM6pxkAkZ1uBoEkEGIGNLZJnfG29xvLCGmoIos01UHTQbUU609nMVpBaIIGCFI57BV4L+XYRI3ZA1HRu4RkPKG7Ylp0TwxJkxrM6BUq93m2WHtVwvjEr4zrModcj+Hu2TnoBxDAEyJOSTNr6KzwH76jV1jvHwZiNqsaFFtdLWCNeD3YuZ3Dxvz0iBq+eJd2/EMEh3VAbJrIF35Z1evODnR/MR2WQEXXGGii8334PhxW7tAuS5S+m6mhjlyyW8ePHVeO4Lw6/cEbJvGVOBRBlFOA/tUX+bbaKqv/DjrU+q1WINgElEkws7zb5pEtgVNgeSAOmglu5ewu2kl0wHmrl9PgUdMNYCGhzFTDtH6rvNDb7+oi0VIi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB2815.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(110136005)(31696002)(186003)(86362001)(52116002)(6486002)(33964004)(5660300002)(16526019)(53546011)(16576012)(26005)(316002)(478600001)(83380400001)(8676002)(66946007)(66476007)(2616005)(66556008)(8936002)(956004)(31686004)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: E+67Ner4pUspdudeEiGNLfTvqRnSzC8EOtTjiPco7HnjsoHdWDqMLWxqj+EFMhtc2fUxCfiFi6dMINaP6TbRL589GI48lR8NWZ3gxRDp6Y8xuWw3EQsGGiHvvHjeSSZPJrXAl00RpUmj+MRyEK+vrfpSRqq6dDqJYEJuPOVQIs2pfOWxWE9CIRhcmqgFvDxyNklSr/Y/Nl4gMY6s3y9nGmXAvLXogjPWp/us7A8kq1ArH6mxU+lXZbwZeZC+gtPV54mOrjkpFZmJiTuOwLwKPx0IjUtQwSp6JgIdV+BooURobqtaxGu7leY63rojo6pHev83n5X+X7j7elwWyRwyBmIqurGofqeb8ZvxyBgz4Bav0fuNzfdKUog+KK+6Rzobw1sHZRvmBMVwi24KdJMBQzGOJXq9hAHqEjRAi8ZacOBTrRiW3S5V2lgK12XeAX15NeBKY2IddYnWlIffsxLw/xONu6vryXNValhqXM8g//otVKve++2BSm9ntR5G/uwmE60qtBc99oAgRiAwjg3tUDqqu1B1d0hvMwaxkiGfp0N8fySFUZZttWcel8VCqK0xjQ6rMKoUQnfWVr2iGsAlAf5WRegVkpEGa26+KIUvJjE42u2qv1qm3QWC3gNPNRjQCPTpcgBN9Sc9OaLLoMetPA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2c361e-f232-47f1-09ce-08d844c792a8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB2815.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 05:12:02.6590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LY72moWvViQyKLFqk6GtTNNuoBsjoXxl+SGL8vf3jom5GjHyNN870hnm9FzmGLR3WcqPnfO5iNUYJfdRE/vRJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5871
Received-SPF: pass client-ip=40.107.15.72;
 envelope-from=diana.craciun@oss.nxp.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 01:27:12
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 20 Aug 2020 08:54:36 -0400
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0p8UPvwzS4qY

--------------88057977D560F6A2772496A1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yutong,

Is the project using LS1046 peripherals (e.g. the network accelerators)? 
The network accelerators are not emulated in QEMU.

Regards,
Diana

On 8/20/2020 7:45 AM, Yutong Feng wrote:
> Hello,I'm a college student from NYC and my project needs to use NXP 
> LS1046 or ls1043 for research.
> To avoid risks, our group decided to test on QEMU before we make 
> purchase for boards.
> I found on google that Yocto can help me to build an image which can 
> be simulated on QEMU.
> So is that possible? And how to operate?
>
> Best regards,
> Chris


--------------88057977D560F6A2772496A1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Yutong,<br>
      <br>
      Is the project using LS1046 peripherals (e.g. the network
      accelerators)? The network accelerators are not emulated in QEMU.<br>
      <br>
      Regards,<br>
      Diana<br>
      <br>
      On 8/20/2020 7:45 AM, Yutong Feng wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CABtOTBCqHdJFg6+1k+mec1Cb9RM3YFqQzMfKLKXP==H=_zNSjw@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr"><span style="color:rgb(0,0,0);font-family:-webkit-standard;font-size:medium">Hello,I'm
            a college student from NYC and my project needs to use NXP
            LS1046 or ls1043 for research.</span>
          <div style="color:rgb(0,0,0)">To avoid risks, our group
            decided to test on QEMU before we make purchase for boards.</div>
          <div style="color:rgb(0,0,0)">I found on google that Yocto can
            help me to build an image which can be simulated on QEMU.</div>
          <div style="color:rgb(0,0,0)">So is that possible? And how to
            operate?</div>
          <div style="color:rgb(0,0,0)"><br>
          </div>
          <div style="color:rgb(0,0,0)">Best regards,</div>
          <div style="color:rgb(0,0,0)">Chris</div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------88057977D560F6A2772496A1--
