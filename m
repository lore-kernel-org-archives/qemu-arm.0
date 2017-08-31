Received: by 10.223.188.70 with SMTP id a6csp258102wrh;
        Thu, 31 Aug 2017 16:38:31 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb7NFDsaDiQ3n9fEGe6vktqqJBlvzU2SdMxd0XZKKr8j/fC3wSFmsFGlj3q6IHJ3Xvyk3t8y
X-Received: by 10.200.45.178 with SMTP id p47mr161307qta.311.1504222711420;
        Thu, 31 Aug 2017 16:38:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504222711; cv=none;
        d=google.com; s=arc-20160816;
        b=UyDVA0G1aY+0k6g1IlEdg19iQesPlCuY8YtlHzX2nHGyFCrZpEz9hB5tw66ATm92fK
         GXnWZxVHmfb9981hCaPRuxrVLg9cdNfoXKN9+5TPz6dpAyJLQuhDlhTYtfxnbrGRMnDZ
         BVNX/ie/rlvOwibHaHmnWTyucaWQ7dmR1J65Oe2B9xEVW+K7s3Xkm/MpWpqZfzh4x9ut
         IrPfwM70akoALHrfIFQ2ouK9ZKk8y0h6CzIgvLD4B58fd1oyWslxdqSEp2cXRE5my3YT
         SKyTT8RYyuH7FI1AFCNwTGNT1gfE5PW28z/ehQtQsXNQBtXQ95vVoxaHi2L24Dl5g16g
         BvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=KPlHVilGAW9McWZyh+8ledQLt/rYKj7AhdDPEzgTNxs=;
        b=ZMSiYATrR50B7OsojMWLePaPGak72h7W2H72zYzlxaPxnvDGPh7E1QuGM6qFfc/74A
         QuWrqYVu8SaKkqrdN/5g8Jeq/jQgxVB2U/ME4P1xAlS1YRofW6SzausL24yPBV9si6cB
         lPBVb954hZF3tZ9GTIDRPirO6RXbm9el+GfdBRrKOWAFIrU0B06WlzTjHC/tJGjYsPg+
         e+cruDXkxJ6qi3MzchSG9NdFVjibC5KuRJ3YHN6ZIb5rH9/vwVFGct1/ONEARqGJHOvA
         7LMCLohOFlYdIZ2jJOPhPznnxizgjR1qfll4Fe2wX7ncyC2UnrAqkLnFgWSGfPMdDOfY
         8yMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=0fqPbeHr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j37si891497qte.451.2017.08.31.16.38.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Aug 2017 16:38:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=0fqPbeHr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33016 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnZ2b-0003Sf-6q
	for alex.bennee@linaro.org; Thu, 31 Aug 2017 19:38:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnZ2A-0003Fh-3n
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 19:38:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnZ25-0003cU-7Z
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 19:38:02 -0400
Received: from mail-dm3nam03on0063.outbound.protection.outlook.com
	([104.47.41.63]:61948
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dnZ24-0003bm-UR; Thu, 31 Aug 2017 19:37:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=KPlHVilGAW9McWZyh+8ledQLt/rYKj7AhdDPEzgTNxs=;
	b=0fqPbeHr1Uei/G9dIsPde8IS10jbnnd3HV5K0UnLu96Ew1wMq5C4ZEtsxdUE+emv5tHaOTeSEWhtduAvdNUgDyruxx0z4ljgXJyeP/XsOPPvykM7N16o0NBmJVHiypgeVvoKrmzjeRTf6Qsws1N5cAnDibB4yU440uo/mEmzB7Q=
Received: from CY4PR02CA0014.namprd02.prod.outlook.com (10.169.188.24) by
	BLUPR0201MB1924.namprd02.prod.outlook.com (10.162.239.158) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.13.10;
	Thu, 31 Aug 2017 23:37:54 +0000
Received: from CY1NAM02FT046.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by CY4PR02CA0014.outlook.office365.com
	(2603:10b6:903:18::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.13.10 via
	Frontend Transport; Thu, 31 Aug 2017 23:37:54 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT046.mail.protection.outlook.com (10.152.74.232) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1385.11
	via Frontend Transport; Thu, 31 Aug 2017 23:37:53 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnZ20-00022P-Jo; Thu, 31 Aug 2017 16:37:52 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnZ20-0006rR-Ej; Thu, 31 Aug 2017 16:37:52 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v7VNbnlo026235; Thu, 31 Aug 2017 16:37:49 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnZ1x-0006r7-5I; Thu, 31 Aug 2017 16:37:49 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Thu, 31 Aug 2017 16:34:14 -0700
Message-ID: <cover.1504222314.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23292.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(189002)(199003)(106466001)(81166006)(81156014)(36386004)(5660300001)(39060400002)(33646002)(8676002)(63266004)(50466002)(48376002)(9786002)(36756003)(50986999)(54906002)(2201001)(626005)(4326008)(50226002)(47776003)(77096006)(356003)(6666003)(478600001)(305945005)(5003940100001)(8936002)(2906002)(189998001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR0201MB1924;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT046;
	1:gXJLcdcPJ4pFKBwqn7revxVPn9OQ5BFhHDmGBcUoLOnQAY1CaVB7XZtTmCZX4+IEnswRTQ1ew82lrt+IPT1kBiyymz+it6pP1a3KCf725Ff3KL7FfrZ+fZv2DJj8xHts
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32dc67fb-83cd-4a61-bc39-08d4f0c94d58
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BLUPR0201MB1924; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1924;
	3:b/J3lBpN3nWb7HdwOg33sVxY/ouDUYd2cLRBOdoR3Jdy8tO4rZTtR3z+wRj+LQFQ8qC9L0MZdFn9Z+nDkSY2TheVEQocyQN+gSG+wO+lkrppKmRu8P5J+TsUtPOj1YT0XBEIcifEAJM23wAE68qiIL3x+j0yjxsVjXaxvQJ+GmYtbB00FOIHm0LQzJf4VXc2zbiRcp1abUIJhUViEDMqJF6ug2px7sYr6GB4YPVnyonzTzmgVra89nrqbqXTDql1GTEx55BxF0YS/oFCss1Hji4xkSPuBdf7PsrhqVx5E1SKS0vtVUE65pRj62MQ5wXFou+F/Xw+bNZADInyvhAZjiO6WJ4Gy5Okxs6feKhPH9U=;
	25:YMCuccQEX7dh3ntzgNz5/vin7HV3vCaWui0X7J5+Kp9SMKbL4835T4RRjL9F0wmZRlmSYRH9lUQombW9IjVGPydsY0kaDdcU8AxG48l8qBNIw7zfZKesRM3NYv4GqMqpKMrW6bfvyM0I45v3eGgVl0HcKQ6phFaen33xQtsyP+MrKcLtGHLqAtHF6m8zV/OGOma7W0BSf3t0kNOoHLiOcIvWeIEcqKKkrA28n+df2xY+TRb9xhyUVUBBXLipjHJXY8yZOX3YJjBxv7jD29ENtl+2uD6Iwua3OvmvsVa+crPigWwdRaiDhYW9ageVPxMXmzHqWavPjrqqx7KQnEInow==
X-MS-TrafficTypeDiagnostic: BLUPR0201MB1924:
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1924;
	31:cvbGE8kff6c2RpCV3YP5Yi1jx5hTT+ELec3TzfRVVf0u48kQPPYYHXXy7kt59nLJtpMM91+cbfBp0Q6ElvxPOC9GVVki/pcPTt65AcsOfu5fwpUh+iBLLK6UTx6MYp/PMZh6Qf0JnO4vr3OaJ0R73K7LPRUVDA+0aialH1jKBv/S8GLjNOTMKgLuSH8+TTV6SeIBeQ6N7szXaA2BptqJguKYw943gVvOKTdj0n7vGUQ=;
	20:QJwmu4sP9N7dHfzlNWMCFvYoMei24XcUTtZJa7pNJi9muXn9nLLNUK4LrUbqUL2sJmClKusCvTBAUJm0DDpeBBvzRUim6uPe2qJiqjkS8TFfvippOVlXbh2xH4p516TM1MTbiLMTrZPR0GwwOhJA23m+9RpjNofOlHOQQcxh3vuX7yQite1Vhx6r7losEzURSsx5d27+9Gdr15sncSRbTFz+CiENjnVMWIRlbXnxANmF00SDUfqy75mlXaqbqNF64BVqRcsGW3MGykCNVHGkHh1+NcoTY3fz2K/fI+13POd+dyYJvG23djCCnggGNHnOojexL83ASj8uEWjo9ztfrIcxQByMlUhSIqGa6idekPKN6gfcm7eCaaOPlomA+XtDLcOmv1JXAzDBJBcNff9M50xspVoFsEEzGwoZAJniS3FznczOkVMfJuUknaAlCXHQm44ZwKA8v/EqeS49TYyAN0IGgguyZTUJI31mDLtd1RxGYR8gi5j5GM74EFwcdy6E
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <BLUPR0201MB1924023F6E83E4DF94BB90FCDC9D0@BLUPR0201MB1924.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(13018025)(13016025)(5005006)(8121501046)(93006095)(93004095)(10201501046)(3002001)(100000703101)(100105400095)(6055026)(6041248)(20161123558100)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123555025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BLUPR0201MB1924; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BLUPR0201MB1924; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1924;
	4:OgFHpSfqVlXSkaR3HwJ3yNU3CASEPTQoCKNnFoPVlF36R6CrtzF4tZNtHYuGZ9GpoLlLuRk7eorMc24bFuvc2qrXdmPLEXV/upROeU2cREVxXdBBSp+0MSfhLmeTprVHMi7AXbgVMgbudvNizOlx9nX43g9Il58wNHGSQkGd8+qfwVnfbAnhqZv7zfS9+b0/JwyDPLs/h9QkgRplVKf7Ci3Q5RbOQh8aY1upuzGFk/PN9k5TJ8eo2+c4QRxJDLfr
X-Forefront-PRVS: 04163EF38A
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1924;
	23:uvFj9FyCUIBEBe3o8iTvWmG3EJcb4+nP1obafMSO34+2aL5tQcT70V3uZXYSxyRPbeaciftB0+kmOk6xMyqRpS26VJAQbMCriMVHoovcDmL/bOLbes14iZEjFq00hRRyNqNL1X5Ohrn2b6sb87khOSP9v3IjXyNagTQhdIVT1lDM8tjOPGjotFVa6Wrt2OKJfkMkVQvFiWDuySSBQpZ1eKEq6ICIngTzD3uphevPwZLHUSHrKstoU5nG+LMz8RcYHO+GCQZjHVEr4aPvp9CwWwUbQsKNowrBn/kFbT7nmcJo12rhCr6FkSzqpOK1f7maUBb84qCNBVu2mcPudhrybjTfcraWkv2qEEralLZ4qakpC2KOjdU9QSTZZmhu1IPmRXIADT+3/AKDBWizAioGMafbXBwEZ/eYHGhaIuWsyAoVf+dzqwa0sAKp1ey+HakFTne33FBxcfqzaK4ytO4yZ9HH7fKdjez2Q/O9Bn9ErbKu/ug8r7P3PjrgP21xRVuYRpaOsub2UOV7eIm/xATEVO1E4nDNVUMWztxOKYqtRGawEgvJ6uVDLb4qyX8FEzsep/Ee/IRiKaumS1glsWbw5Qsa/LKcq351+b0902bCX4jlgpeF3ORhvZ5RwiKrDp5J8M89Mwsj0WDHM+7KI9FShi94+xfgHBnX73MbGeA69bknfhzOrd9LbbAXr1wdf+PagluibH/e2HiGBFbQcbkPbTYp90DP724F23YsuBjojAxiolDlhn4m9EcJEjUkiSmGnnSIESzcqcc4s/0q0FYFdpwWioj9ItymzcdyUryMVbRF/ZFYha1B+lHo9KYWLu1BbxqF9pUWB7SXr59zK/3946ZND2sd6Ll7Ab543rRMY5IwJGXu6Z/kivl21XpA4H2Ed6nlEnyN8e9+ZgnB0DoInA==
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1924;
	6:Oj1tiw32BU0pVGC4AwwOQQ6w/NDGzmGJk+wYblBkomYLvGU8/c8xygWnii9jwHECXPCdopH4tprPkhaF1hEDDxKd4hI7wkvlBXmM8gRGDraL1+oCaj7sIbhsO1IgF/SGqcRTY3gQ9lIcGDMhEkRSmwcoiAdLnvmNX2FicJfIdSE45nur3zXWKCr0EdOqSKVkGo0sMixiVeDi002m632rtdiaMkF0xFcXeirx/xixUAba+4Jmvco4/52o/cyXGP9fONYRlIoxJVoYwfmZJyt5encXE9QPLWAvllXuex6QuzVw3NDJdQkwFkeadwFBwPLQmO04+e+0t/skEwORt3bhdg==;
	5:zXnukaBogT9+CRQo+eJLdMJ/TP6Ap17NmkVpm7IM6H97bb366e2A8sAuj5bB37ix1ztEGhYDWEl1T0EIkq9A9ogxXmvLjFubY2qUnTxTp353o6nffnJEOe9N1ApjLNM6kjeu/phgGUgSnTSHbFRJNA==;
	24:/kmbV7rcktP4Xlj2LsMXzVTQuNFxQx6ZAIBJO6qExITV+ezkF/vovwLYKlWIUeEb4kpSZs+vTc5woPFPFBiSXSsYY/Wo3NqdTdREqv16JlI=;
	7:jz6NJ7B8OBiU1UJRdE904orotBby07R8V5PXmZnOCxNL7NMatLSzva6BL7uTZeaR5KecIZHSVbOEB1MvTfgAgk6o73wWxt3iGKUjtVR3UETdWoUnIcsMtjfzIBZQ3OFUpZvV7AaHmG10Dr2xYPgT2G9LMoP8fjcB5E2IsgIEwunwF/AfiUb5K0xYzUefIaw+F/oHsbrJmFgC9CIFlJjZwIW1R1rnQHbk277k/OG/eag=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2017 23:37:53.8617 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0201MB1924
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.63
Subject: [Qemu-arm] [PATCH v2 0/5] Expose the secure and virt properties to
 the
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
Cc: edgar.iglesias@xilinx.com, alistair23@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Snc56SvvzStN


The EL2 and EL3 work is working well now and interanlly we now have
tests that expect to start in EL3 and transition through EL2 to EL1. To
make this easy to run let's expose the secure property to the machine
and also add a virt property that can enable EL2.

This series also does some machine/name tidying up and makes the first
move to deprecating the EP108 machine, which was just an early access
development board.

V2:
 - Add a virt option for setting EL2



Alistair Francis (5):
  xlnx-ep108: Rename to ZCU102
  xlnx-zcu102: Manually create the machines
  xlnx-zcu102: Add a machine level secure property
  xlnx-zcu102: Add a machine level virtualization property
  xlnx-zcu102: Mark the EP108 machine as deprecated

 hw/arm/Makefile.objs         |   2 +-
 hw/arm/xlnx-ep108.c          | 137 -----------------------
 hw/arm/xlnx-zcu102.c         | 257 +++++++++++++++++++++++++++++++++++++++++++
 hw/arm/xlnx-zynqmp.c         |   3 +-
 include/hw/arm/xlnx-zynqmp.h |   2 +
 5 files changed, 262 insertions(+), 139 deletions(-)
 delete mode 100644 hw/arm/xlnx-ep108.c
 create mode 100644 hw/arm/xlnx-zcu102.c

-- 
2.11.0

