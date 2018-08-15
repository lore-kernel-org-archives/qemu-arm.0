Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp546366wru;
        Wed, 15 Aug 2018 03:55:10 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwEr7rhIiQ2ruP0pD98LXDMfNQeou2K39YYaefF+TiH+532vGatnLVkWjqRgQhMbNFdeq+5
X-Received: by 2002:ac8:2cd1:: with SMTP id 17-v6mr24477142qtx.360.1534330510896;
        Wed, 15 Aug 2018 03:55:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534330510; cv=none;
        d=google.com; s=arc-20160816;
        b=YLQukZqd/tW1CUnqODaif2K8o6QYg1i4Sw0xx1p8G7etBM4XkY8pHH4ZgZPo632Jsc
         L3AR56aoZiQgmJWrkoZirn96gMx1ksvWXQDUCqNqVILeP1Pdd/F2ctFT/8Tsn6fBsGz7
         CF1mgdAexeW/ExYnYpnlQxu9YOR2U4eLKdkWcOoazt3E2amTET1df1mZX7aFenre/Z63
         ssYTC1r2RPYwx2C/Uvv6PLJDpaFGRz05p5aAwPC68QVnYys6geErSTiNpAdcU4ssAzaE
         o6+ceFBnjodq1TtMJJVHdQj1LOzagnpMMWfDobckLav6KpKbRVHOv5itwlXRMJY+yM4J
         mjqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=9sDQlbTjW+VW2NV3S1iEGooaNku1MJGEUbbKAnXO+2Y=;
        b=QFxXJ2stUxKEu2pW9/GMvj+6Q1sWHD6q8YXCk1go8qPlhZ6UiAvpQcxI64wRCb3VvU
         iN1snoq+YT8qJYgUfhERAY8va/pvbWudhspQogmwXJ0/sUY+keNriVXn1gQudiG4RTwj
         S8xnVBFXazCdMp1KsF09RxHF7v86au4YRm21c91QMkL8bhvq+g1cAT20ycV25jvpiSxp
         QE4U0V8gqPQ15l1gdifwekfth51KzIYjkSuaQuyGIjuS7JuK2XtP+rp6WIjAjz7pG9N9
         xzmJ1THQFb36f7qKZOhfSzUHWwyHKwvYCV7hCxGB5EODP8QT4QNvOphmGSgwelUfSyGg
         GzXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=SuV5+sho;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x8-v6si19884qvi.233.2018.08.15.03.55.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Aug 2018 03:55:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=SuV5+sho;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48540 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fptSI-0003Vj-ED
	for alex.bennee@linaro.org; Wed, 15 Aug 2018 06:55:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fptS5-0003T0-PQ
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 06:55:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fptS4-0005wZ-Cd
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 06:54:57 -0400
Received: from mail-sn1nam01on0062.outbound.protection.outlook.com
	([104.47.32.62]:56576
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1fptRx-0005t6-9r; Wed, 15 Aug 2018 06:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9sDQlbTjW+VW2NV3S1iEGooaNku1MJGEUbbKAnXO+2Y=;
	b=SuV5+shop06eQYMNpFB0CMdN3enGouo/H38vmTyT+rAgS9ZtKcmwwO72Q7j78xDA0JauZNAZjWODYoRst22FeWq5GEph96azl6PiyHAZm4Rvq9GGyyeD/ytWvwN0XJdL26jy/jKphMunP6UAArjdPeAiuSl6UEHg0z7eQfUU1k0=
Received: from BL0PR02CA0058.namprd02.prod.outlook.com (2603:10b6:207:3d::35)
	by DM6PR02MB4458.namprd02.prod.outlook.com (2603:10b6:5:29::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1038.19;
	Wed, 15 Aug 2018 10:54:46 +0000
Received: from BL2NAM02FT032.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::203) by BL0PR02CA0058.outlook.office365.com
	(2603:10b6:207:3d::35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1038.22 via
	Frontend Transport; Wed, 15 Aug 2018 10:54:46 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; greensocs.com; dkim=none (message not signed)
	header.d=none;greensocs.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT032.mail.protection.outlook.com (10.152.77.169) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1059.14
	via Frontend Transport; Wed, 15 Aug 2018 10:54:45 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fptRs-0007sd-Mj; Wed, 15 Aug 2018 03:54:44 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fptRn-0001s7-Ik; Wed, 15 Aug 2018 03:54:39 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w7FAsWfP027427; Wed, 15 Aug 2018 03:54:32 -0700
Received: from [10.23.118.101] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fptRf-0001qD-RI; Wed, 15 Aug 2018 03:54:32 -0700
Date: Wed, 15 Aug 2018 12:54:30 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180815105430.e6satguezkvfudf5@toto>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-11-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180814124254.5229-11-peter.maydell@linaro.org>
User-Agent: NeoMutt/20170609 (1.8.3)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(39860400002)(396003)(376002)(136003)(346002)(2980300002)(438002)(199004)(189003)(23726003)(36386004)(81156014)(81166006)(26005)(575784001)(47776003)(229853002)(9686003)(5660300001)(9786002)(33716001)(186003)(77096007)(8936002)(305945005)(8676002)(106002)(76176011)(50466002)(126002)(4326008)(97756001)(478600001)(316002)(476003)(426003)(107886003)(6246003)(2906002)(54906003)(1076002)(58126008)(336012)(446003)(16586007)(46406003)(486006)(6916009)(11346002)(63266004)(356003)(106466001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4458; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT032;
	1:GvkEBGv2otX9L534mrfCtnunk7Clk6u6l4Phamu3tiIr+Qbd6Jbhfuaubl3eiNQ4qwWcgHnzcoP+NdfxGAmiypFSfROXXdDaGK8y10KkQ7TRmPVvblaRXi2n9Bmrt5rJ
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31686175-e176-4315-21fd-08d6029d835d
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600074)(711020)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060);
	SRVR:DM6PR02MB4458; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4458;
	3:H1plrEzHiqzHuZw++x1uWT53nh84foIuuOOwyQnRXW87vdC5jEa6uU96YnzMtBr1Jm6iXBnXsKi5yQhc939pcRla8XCcVcJiUG21ZKURa0Hd8llVAPuZ7U063W5UgdPLoq7q1AmzxXijj5F7S9zzMun3g3rEIS+hyEhDX1GjlBxj0crJN09xQvhlub4pzptSoKaiN2bj7JpAw4pwVT8gAmsw1KKVPPobs4mWkpbfTX2TRmEsmJW4HstD2QJoyJ1eRmela83SBfVmn8KaKyxeLTOHf4z70CAm6UKPfJVberzDr0/Ks5nvFHJeSFejG1bC17UOFnydqVrbLS7sbefft3eWyAyxw0IXILVRlUiKPQE=;
	25:4ODn6paN4CpKkNC6hckFTn7bRsbyMq3fVOGSTRs6kOI55xYcduiYpdmDow+4TlQHVUHwHU/xic9euFeTGg/ZnFyGNsA7T187vWfTdEwn8DuRWbhyxCSy87mQ/xoipUilndrM6UMMj+JGU1/LI7MEuwpGlIpaBSde/BqFZOFZrwIzhAsJsbZkQsqaVHEZ/08NSX/m9nfP/cL9oRD27zVgHuFG660TlqobIf7hkdqHHYs2b47mBEpgaPjFIoCrwVtDJ8cN7Zivc2d/dyP0sdw7wQC0wPOJX/o93xTURcuIufYTOOijGfJb2C7f8xrz+IwuNJ+MV7kmNsKlz9JsPy7j/A==
X-MS-TrafficTypeDiagnostic: DM6PR02MB4458:
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4458;
	31:z+sJOK/9tbuvFPo8dW+fi+oEwdl3wH5/tu7Y3pZl917BEd51g2Ib4UiNVs+cckKr4HF+uMJwvmH9eOuSbL/d8fj832R0I0u87UbmIctmI8aQ914vylAc4lneZj3Lh6+GBy2SZKWkl90SbjaYCs4YXpeYp6NF/1i/QgEiF/25cZ+M9fJsOZUpxG4mgyAilWapuBGL+BbMKw/uhv8LAQ5dNoUhhQF3sgRDCkGsBM1WjLs=;
	20:SvPbbdVPioCy/OLn7ivTWsJPbtEqVPV8AFRDT244hvHZRRQ91gkmMZI+I6mdN21Cbv2mn8Lg7dsgqCWUpoYJE9iCV/R8PdtaWICIK9yOJYf3veTHg1XEi8j8+bufk4D/C/PwAEmVCogMMtFV4KvIDitQj5crhcJSwLvGlygGk/Sb0uIZMCnVvuAu7h+6OwN+4JRqanMF91QYG9Vte7qQ8Rb/wyAFzLZ2cHcv/a6IO0edJnFpsp5BYrpszTWhV8bkYB6K+F/Eu2V1W/8WQutz7YkA8N7z075b697J7KobPdJTXR1MjYxwa9aBil4eqpRepEVuAo8IC0vhtc/UYWK/uuZJPaK0TuvkzBVBnigHA5lT3xn3S24Vz/qthjjG7aJyXItxskK1+xjiyttR/gzv4+ZOTEwGQtO6HNXlqe1lTtQBj2qyNDg/1kuQk8SE7FIHZoc0cMrCVQ1FtqMs7d7uusdxcYE/L5S4I8Tj2aHKuTSbhIvi3CiT24FbCFsyTVSV
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB4458CDD8D320BB5A1B69B0C3AB3F0@DM6PR02MB4458.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231311)(944501410)(52105095)(93006095)(93004095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:DM6PR02MB4458; BCL:0; PCL:0; RULEID:; SRVR:DM6PR02MB4458; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4458;
	4:gooFJI1TqCMt6UC1GY8wLH44ts2N2XxotFHSY7BKJjtMSGQ2i9TQmf5aKNvBoqrtQdbpLGY9I/3LCiyXryHz0rhpYp6ADiTJ+X41vsDVrlS03F25+QqBGRqNkv9vJeDbQlKDb3F5K4W6RbO/ag/NrFPPZf4F//kwyKF03+BkhuDsdCEtlMV9IKYELu1AC5Wv9Bet/wzeSv2cH5WsSAezBxb4Ghh/sTZOjbdu+0nd4/FHeG0ywOklLx/P1HXDL1lxYKpuN5GgR1WuF48RtIZQyw==
X-Forefront-PRVS: 07658B8EA3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM6PR02MB4458;
	23:SCqBinPCoJYBo/fpKcNLmnkUsj1P1x1hCc7OeT7M8?=
	=?us-ascii?Q?qgX+GlXl6OELBhnBFbyOxDJ4OwcHYVDpYXJ6J2M0Y9ZJgAYx6cJxlbzAShU1?=
	=?us-ascii?Q?PbHGuS71Ou1YiMFBvhsycZBSEyit1dCz/hdOOXuZ6+tYCAtywZcfHW7RY+Fx?=
	=?us-ascii?Q?P5sQrQ8D68LutdokdU+ujaZBZLmrZWMCZNXJ5dygUyFvW6ZrIBiY0Gg7VB1z?=
	=?us-ascii?Q?FdvKwm799M5F5w/gk5JPUHFEIKgQFkBsvQ7k2aDYr+04bWOO4XPuHN1N/rFw?=
	=?us-ascii?Q?vae6jDhjQ68KLTwWfRrXN8xNDiM4AlD1DCgfCX1Q3QwyImE4DuapIZx6ejwF?=
	=?us-ascii?Q?g6Npso/BfNlXflr9+wjaPfXfqUXGBiCarmhjv7NAzLP5wjyh4LQUw1oq1gIl?=
	=?us-ascii?Q?75Kgw2rJuuDhUnwsmLfBDbbbJMvF1acP/8M/+o+MTcMbrvDc+DQagZOOlE4B?=
	=?us-ascii?Q?HxjzVYgi88LiCH4g3L6dFkdHvVB2OM2k33+DkidOxHXXbJB5J8Js6r5cDsCu?=
	=?us-ascii?Q?1xy3ICjG0IcsQfGCTy7MftDknBeGycRflAXOiStRm8bLZRkUYihZ8DZjq11i?=
	=?us-ascii?Q?585od8NZevf+sxS7byF0MYXumrIG6lyIRDTEhOe4xItYLIMsPpngiFgujQc0?=
	=?us-ascii?Q?8TKsv6C3r6SDhtdc1WOErVqoGIf+RcBhYb7OF916EdWhVfkWgRj0Eyg5CeDU?=
	=?us-ascii?Q?DbQRSlcO3NFTHgF3KJlZR5Nm07OgpSQkmXjf5kA0E+977BwZ8UfDKhL/HuEs?=
	=?us-ascii?Q?KuzM2u3eUNOdwwe6y7c4GPgbT1ApJxafdSCywvraWyHrNi7xAJ/04Sz3r0zD?=
	=?us-ascii?Q?QNrIzacmS197LL93IVCKbPzU2On1phsmvFC3XKtX774+XPKT3QBKjZ8WOqk5?=
	=?us-ascii?Q?vA60cg49AvO5wG9AoEm2Xsvq6Kc4rOrIVAynBn9bZ4AuP6trkNxR12gTrG5I?=
	=?us-ascii?Q?cf5aclbp9fNXBKIAGF4Z2KfTJSKwAosML1Qe/GgXzKaLxzTjTMHaQ6paXss+?=
	=?us-ascii?Q?ve6eDMP40DFtcxEE/Zwe7SRd8kAZJimBElYSNQ/iFiyhYwmgBKM6N98tnzBZ?=
	=?us-ascii?Q?wXOkWBoO8kS6u6DOm4lZ0Rfv6GPMRQfNoA3YHVn2jZGbIm1ejZgh0p/1QqYN?=
	=?us-ascii?Q?kV9yiBTRXxKCX+hQS7hkS42jTa7hOwxlqZLyqS147as03ADeFsQSNCTmqW4I?=
	=?us-ascii?Q?XwZMf+6IsKMv0A=3D?=
X-Microsoft-Antispam-Message-Info: iOo4E58lpQgRT5Bb3sgrT7DqpE/VwVeEh6Cm/4rOzIUaCMQH33LC64XrGgoHciNkUUg6S05hFshoTlvbgCp6sRCPpObX4sxvg9uPjQ31Zh7YJKFuWtQtXTMNTYhRo4Ar2KU6BYBvXjmKVqE66INRN9KJpaXDBuirH1CF1wCu5iTzs/Ku1I2EVwYehYGyZxyoBwxKLpP82SQYqIxFm7vCZ5mqNJB4S9RMniuZRJEygNwqwd/JkEh8uw3p5tcUayXyWtA5XK0eP/PlXALcIJisNldNa1gMh0Au6D6wkSvoa6ImHCN936gCBMMaRQ7opDQNlxh/xxOBMMkJ7IzL4Fqn9RJlrwYqhGhPPtimmRoxTI4=
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4458;
	6:sPztwYh9WXvmUldHFlLstMZF6jAL/ZmRVn0IifvU0i2nWyrnqx6uZ+5OEpto1s9/Ny2BP5/3UEIaX0XZRcBy5ONpLbWo1LcD/bZTOfGBirn/IQ6naZVC6vKHP+JEby9yqgJR0NtIP5NXqghqF74o5GgHqbKm4kX7XM+Hb28bLwFCfdj1paXtGKZ8BGrpCrCjnefkkB+mHYcZbjfKdENxyt1FU+VhpbwyfX/KqCJzJFQywwTatWQfKS4BQWGl5qJzUnU4gzdxNwcb7DqXqwNyoEJA1PUXyePlAnjU5dYXEIjsN5iaLVyJkvKIXd0kUy9FJ2c+IHim0UpBMwqq9kzuXyY496FqSZunYtgSZkWiaJyWUyQNkdm0UIZ/qrW4Zh2cUAupgAG/UnwJZJ3gyoaXpzKbrXRC5yXpz1oGWKebfrBv5M1eVn0HT0tfZgGgwJm2wnn0sYElldxUoKvXYpYxqg==;
	5:peLW65xMm789+SX+RiaR80wgHFglfbhM33WHy0RHEjWDUF6fpz74B6yKlzEcPj0NZm+NPHGqcWV/yqgwRnYsxYRm2nLfDvIQvvul8plyR5rMvs4YUxDZMbqh7fO83kyibL3QbYP+q3dk4xojV36jZWVLMp3ztXPFQykbCpW4sEI=;
	7:+wT1/v8LBw0mID2FVBQfxa3xwt2Mio6KV7jhseJdhXccPp895Vp7et5dcXp72g8v+sAqq/FnAuTSsv23t9NEYgejXEiaaEkXID7m504JOAQZXE77pwMnmCaXE/FC7lw8MJqfe8LINUDLGA8VLx6I7dk9RyRvUHk+3FSeeno8bsym+1dDNWPh9UgakxdpuU3OyzpqemAL486R22AehpxuIyL5tKYSEE6CvwlwDIMfG+k1gFm4mPKM10yL43xpUoIW
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2018 10:54:45.3731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31686175-e176-4315-21fd-08d6029d835d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4458
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.62
Subject: Re: [Qemu-arm] [PATCH 10/10] target/arm: Implement support for
 taking exceptions to Hyp mode
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: edgari@xilinx.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DD1AiedL8Rhv

On Tue, Aug 14, 2018 at 01:42:54PM +0100, Peter Maydell wrote:
> Implement the necessary support code for taking exceptions
> to Hyp mode in AArch32.

Hi Peter,

A general comment that I think this would be a little easier
to look at if it was split into two patches, one non-functional
change to break-out take_aarch32_exception() and then another
patch to add the new logic...

Another comment inline below

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 146 +++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 123 insertions(+), 23 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 80855302089..167203ac664 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8013,6 +8013,123 @@ void aarch64_sync_64_to_32(CPUARMState *env)
>      env->regs[15] = env->pc;
>  }
>  
> +static void take_aarch32_exception(CPUARMState *env, int new_mode,
> +                                   uint32_t mask, uint32_t offset,
> +                                   uint32_t newpc)
> +{
> +    /* Change the CPU state so as to actually take the exception. */
> +    switch_mode(env, new_mode);
> +    /*
> +     * For exceptions taken to AArch32 we must clear the SS bit in both
> +     * PSTATE and in the old-state value we save to SPSR_<mode>, so zero it now.
> +     */
> +    env->uncached_cpsr &= ~PSTATE_SS;
> +    env->spsr = cpsr_read(env);
> +    /* Clear IT bits.  */
> +    env->condexec_bits = 0;
> +    /* Switch to the new mode, and to the correct instruction set.  */
> +    env->uncached_cpsr = (env->uncached_cpsr & ~CPSR_M) | new_mode;
> +    /* Set new mode endianness */
> +    env->uncached_cpsr &= ~CPSR_E;
> +    if (env->cp15.sctlr_el[arm_current_el(env)] & SCTLR_EE) {
> +        env->uncached_cpsr |= CPSR_E;
> +    }
> +    env->daif |= mask;
> +
> +    if (new_mode == ARM_CPU_MODE_HYP) {
> +        env->thumb = (env->cp15.sctlr_el[2] & SCTLR_TE) != 0;
> +        env->elr_el[2] = env->regs[15];
> +    } else {
> +        /*
> +         * this is a lie, as there was no c1_sys on V4T/V5, but who cares
> +         * and we should just guard the thumb mode on V4
> +         */
> +        if (arm_feature(env, ARM_FEATURE_V4T)) {
> +            env->thumb =
> +                (A32_BANKED_CURRENT_REG_GET(env, sctlr) & SCTLR_TE) != 0;
> +        }
> +        env->regs[14] = env->regs[15] + offset;
> +    }
> +    env->regs[15] = newpc;
> +}
> +
> +static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
> +{
> +    /*
> +     * Handle exception entry to Hyp mode; this is sufficiently
> +     * different to entry to other AArch32 modes that we handle it
> +     * separately here.
> +     *
> +     * The vector table entry used is always the 0x14 Hyp mode entry point,
> +     * unless this is an UNDEF/HVC/abort taken from Hyp to Hyp.
> +     * The offset applied to the preferred return address is always zero
> +     * (see DDI0487C.a section G1.12.3).
> +     * PSTATE A/I/F masks are set based only on the SCR.EA/IRQ/FIQ values.
> +     */
> +    uint32_t addr, mask;
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +
> +    switch (cs->exception_index) {
> +    case EXCP_UDEF:
> +        addr = 0x04;
> +        break;
> +    case EXCP_SWI:
> +        addr = 0x14;
> +        break;
> +    case EXCP_BKPT:
> +        /* Fall through to prefetch abort.  */
> +    case EXCP_PREFETCH_ABORT:
> +        env->cp15.ifar_s = env->exception.vaddress;
> +        qemu_log_mask(CPU_LOG_INT, "...with HIFAR 0x%x\n",
> +                      (uint32_t)env->exception.vaddress);
> +        addr = 0x0c;
> +        break;
> +    case EXCP_DATA_ABORT:
> +        env->cp15.dfar_s = env->exception.vaddress;
> +        qemu_log_mask(CPU_LOG_INT, "...with HDFAR 0x%x\n",
> +                      (uint32_t)env->exception.vaddress);
> +        addr = 0x10;
> +        break;
> +    case EXCP_IRQ:
> +        addr = 0x18;
> +        break;
> +    case EXCP_FIQ:
> +        addr = 0x1c;
> +        break;
> +    case EXCP_HVC:
> +        addr = 0x08;
> +        break;
> +    case EXCP_HYP_TRAP:
> +        addr = 0x14;
> +    default:
> +        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
> +    }
> +
> +    if (cs->exception_index != EXCP_IRQ && cs->exception_index != EXCP_FIQ) {
> +        env->cp15.esr_el[2] = env->exception.syndrome;
> +    }
> +
> +    if (arm_current_el(env) != 2 && addr < 0x14) {
> +        addr = 0x14;
> +    }
> +
> +    mask = 0;
> +    if (!(env->cp15.scr_el3 & SCR_EA)) {
> +        mask |= CPSR_A;
> +    }
> +    if (!(env->cp15.scr_el3 & SCR_IRQ)) {
> +        mask |= CPSR_I;
> +    }
> +    if (!(env->cp15.scr_el3 & SCR_IRQ)) {a
                                 ^^^^^^^
I think this should test for SCR_FIQ.

Other than those two comments I think this looks OK!

Thanks,
Edgar





> +        mask |= CPSR_F;
> +    }
> +
> +    addr += env->cp15.hvbar;
> +
> +    take_aarch32_exception(env, ARM_CPU_MODE_HYP, mask, 0, addr);
> +}
> +
>  static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
> @@ -8048,6 +8165,11 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
>          env->cp15.mdscr_el1 = deposit64(env->cp15.mdscr_el1, 2, 4, moe);
>      }
>  
> +    if (env->exception.target_el == 2) {
> +        arm_cpu_do_interrupt_aarch32_hyp(cs);
> +        return;
> +    }
> +
>      /* TODO: Vectored interrupt controller.  */
>      switch (cs->exception_index) {
>      case EXCP_UDEF:
> @@ -8155,29 +8277,7 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
>          env->cp15.scr_el3 &= ~SCR_NS;
>      }
>  
> -    switch_mode (env, new_mode);
> -    /* For exceptions taken to AArch32 we must clear the SS bit in both
> -     * PSTATE and in the old-state value we save to SPSR_<mode>, so zero it now.
> -     */
> -    env->uncached_cpsr &= ~PSTATE_SS;
> -    env->spsr = cpsr_read(env);
> -    /* Clear IT bits.  */
> -    env->condexec_bits = 0;
> -    /* Switch to the new mode, and to the correct instruction set.  */
> -    env->uncached_cpsr = (env->uncached_cpsr & ~CPSR_M) | new_mode;
> -    /* Set new mode endianness */
> -    env->uncached_cpsr &= ~CPSR_E;
> -    if (env->cp15.sctlr_el[arm_current_el(env)] & SCTLR_EE) {
> -        env->uncached_cpsr |= CPSR_E;
> -    }
> -    env->daif |= mask;
> -    /* this is a lie, as the was no c1_sys on V4T/V5, but who cares
> -     * and we should just guard the thumb mode on V4 */
> -    if (arm_feature(env, ARM_FEATURE_V4T)) {
> -        env->thumb = (A32_BANKED_CURRENT_REG_GET(env, sctlr) & SCTLR_TE) != 0;
> -    }
> -    env->regs[14] = env->regs[15] + offset;
> -    env->regs[15] = addr;
> +    take_aarch32_exception(env, new_mode, mask, offset, addr);
>  }
>  
>  /* Handle exception entry to a target EL which is using AArch64 */
> -- 
> 2.18.0
> 
