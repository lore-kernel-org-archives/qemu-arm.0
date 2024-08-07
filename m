Received: by 2002:a05:7022:d82:b0:85:21:bd5b with SMTP id ec2csp532540dlb;
        Wed, 7 Aug 2024 12:54:55 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVXLG6dIN8/1SVYIycL/GGAygpvEY8vm69jCfvktQZnU7AwJtu61UBkINTzUl+dmL3F42lArr/ILrcMYsEfpSMn9Yc//vAC
X-Google-Smtp-Source: AGHT+IGzc3nUOjhftwpehM80KlEG+YAOGzygZ03MY7vw3AV/3ku8FcGFth17GhkIA2vQTOF0ohFv
X-Received: by 2002:a05:6102:38d2:b0:48f:2afe:88f1 with SMTP id ada2fe7eead31-4945be0bbc8mr22042871137.16.1723060495612;
        Wed, 07 Aug 2024 12:54:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723060495; cv=pass;
        d=google.com; s=arc-20160816;
        b=h1hshZR8wkFojwNcwIaNKLtvD/1WS4tBXyR6UX07AOxyxucNQK7F3e+K3PoDg8r902
         IEnteE6kh7T6nyfaijlJz/Y74DmD7IPnJjG7ABTEKTJtcl8dve7a+wnC/E4iKb525u8/
         uWe6E+kVp79snAA622jhTZGiKZaIbodfbWj4hyDblHmtuV0xsnUinmWEWje1vGzI+F70
         yWwl4sXShMy+todiBwYd7rf2kxWk/FwDsTZO/fZavMn0a5jh1jxzq7vJU42tOgOiUYjX
         nnIFVmXD3BsydIPdhFxJ8drphCBuh8m3/9grGXzC+79hAqqK73ue2Q3a5Quq4oKafMAB
         DKgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:stx-hosted-ironport-oubound
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:stx-internal-mailhost
         :dkim-signature:dkim-signature;
        bh=4LJxpTCRra3d9o4ZzYvaBfe7kRfCTZdJ7dfTIFeIIkM=;
        fh=dS3w8vDwfKBN2Vq6GqWGLTptD5N4AIqdQvGcpQjs9Io=;
        b=lBg2c1B8bpqvew4C6mnFGwYpAgP+shhPAcGPqLgH+RnX/n8/m+CMaDnc2QZICxz8A4
         sPXrMLeh2Wjc98ABCsg0I+ZkfV1IVXnwVbfndiTBnMwXVQ6At8YcC7rzWwPAUDTq64wy
         RgtGZkBplC4n0zVn5EfDxdj1JeD+Y4gZ2XKIGmQoltiempfGSXp9gXZL8dLytSNb0nAN
         jg+O25+xyfQrJa/nws+il+yD1DkRR6hsSyyKUz+YTND24Md4dhNSR0OGHuH2vfofjan9
         ftVCmMVMugytq3+/U/m7vn7LCa9TRT7YNGfWgQstTIw4kYx4lG+12/XeG3WElG/18BK7
         NOhg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=fail header.i=@seagate.com header.s=stxiport header.b="D/H64Y+t";
       dkim=pass header.i=@seagate.com header.s=selector1 header.b=bzGBtjF8;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=seagate.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb90be66si26498726d6.448.2024.08.07.12.54.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 12:54:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@seagate.com header.s=stxiport header.b="D/H64Y+t";
       dkim=pass header.i=@seagate.com header.s=selector1 header.b=bzGBtjF8;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=seagate.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbmjb-0006KP-QQ; Wed, 07 Aug 2024 15:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.zeise@seagate.com>)
 id 1sbmjV-0006AI-N0; Wed, 07 Aug 2024 15:54:07 -0400
Received: from esa.hc4959-67.iphmx.com ([216.71.153.94])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.zeise@seagate.com>)
 id 1sbmjT-00020o-VS; Wed, 07 Aug 2024 15:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=seagate.com; i=@seagate.com; q=dns/txt; s=stxiport;
 t=1723060443; x=1754596443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Xy/dx1XReBDHEeZsBi8WfTwzlKBJOOaD9Z33L28jdE=;
 b=D/H64Y+t3E39ToozVV6ljpELSVpr5C65WupCLywUDWzMRMrBppn3Npbs
 NB22pdqoW0Uqeb0WY4w3ULxPiB0tePFHAgItynevVTiQZV6c7f3gHhhqz
 9ELdc4mO7pm+TKs6tOLyjt8FDIEfAC2iqE7QZZshCFy2wpH9m+jK0HQM9 w=;
X-CSE-ConnectionGUID: /gHIsi6BRj+mopw7tKdopg==
X-CSE-MsgGUID: K8oQlt/YTNmgOi5ZJGhKEg==
Received: from mail-mw2nam10lp2042.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.42])
 by ob1.hc4959-67.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 12:54:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APz0pQ/AJVywVWRx4uTScpJj7EwtyEt+yfCj2+Wb8Dc2CryzuDHCodIh7XWlOQN4WB7PtP7ajda6oQPApnBPK9tz8kPfYe7CmXBBDC971RTwVPBnqKtyAuCI42Sr2VtPYoViYJ7+FVzk/om5BLJFbr5C8qqff189nuk1RiL1U/7qYk4jl13hBAKEcrW85tb/5YHr5fmjPu8/X0bmZswb+bWvczTIrOys9ndG6vq6x9VYZ7qWNdfdCxlB6hvvz7updbvtv+GCkhgK9PKfqu5JPxoUxrI7usXkoyNWouy1WvDrxEShqKHAUp5kYKsN96HFlV2nmn7IMdvVqTsbuZzUKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LJxpTCRra3d9o4ZzYvaBfe7kRfCTZdJ7dfTIFeIIkM=;
 b=Ds25tpYgVd79FNG3dvqzUxEngQbWKqOGrjI9FE3QZcC8ObFaQfF+gfqpKX+EgfovBzzKHX7kSjg8H5WIO5Y0Hx0dxWU2y0V1sHvCzEp41uT6L7hVDVwh8adM0/8VBXdhSKmptmDLglPCW8VS+gEQGXe/ojiWjBSq6O14qzse8W+/4L0zVx8ujVi3j6zoJw4BxPQcHNe0MqxwfMr+BZivmi65ZMkHQ2NzVl44nd9ulKLXdCc6CxZgRWduG5Dk+8BA8hp+QNPGC4oXODf3npGEQH5MMC+hBS+BfxH4Ar284G1VeCggLu7lNZY8yXpcCUQdzxoBKnG4PZQA+ZsCVSpxPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 192.55.16.51) smtp.rcpttodomain=nongnu.org smtp.mailfrom=seagate.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=seagate.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seagate.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LJxpTCRra3d9o4ZzYvaBfe7kRfCTZdJ7dfTIFeIIkM=;
 b=bzGBtjF89mA/R2MAQ35Vs6fluFI7ifz0Nixjz9GEf4yC3Qb4CbA2Oec/vlvaQ0ZOKqRIrmayxO0jrIhqwtIE0VMPRGb8PnsSxiGFdfPjbqY2t+sSACTysQVZPzPRu/PW7HiK1iAGlqdz3UZVX9PK0mAhk6EAJ2jJJcsdEfofyv0=
Received: from BL1PR13CA0305.namprd13.prod.outlook.com (2603:10b6:208:2c1::10)
 by SN7PR20MB5288.namprd20.prod.outlook.com (2603:10b6:806:263::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14; Wed, 7 Aug
 2024 19:53:59 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::a6) by BL1PR13CA0305.outlook.office365.com
 (2603:10b6:208:2c1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.10 via Frontend
 Transport; Wed, 7 Aug 2024 19:53:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 192.55.16.51)
 smtp.mailfrom=seagate.com;
 dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=seagate.com;
Received: from sgspzesaa002.seagate.com (192.55.16.51) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 19:53:57 +0000
X-CSE-ConnectionGUID: n5inpn2tRoKQQp36uf86Lw==
X-CSE-MsgGUID: epZXLnWLT9KsaG9mN9aPlA==
Received: from sgspiesaa002.seagate.com ([10.4.144.53])
 by sgspzesaa002.seagate.com with ESMTP; 07 Aug 2024 12:53:47 -0700
X-CSE-ConnectionGUID: nQjhZA+gQc+5+XD6tJ3Pgg==
X-CSE-MsgGUID: jMi3is4cRM2dutptCRvefg==
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="122235480"
STX-Internal-Mailhost: TRUE
Received: from unknown (HELO cortana..) ([10.4.50.14])
 by sgspiesaa002.seagate.com with ESMTP; 07 Aug 2024 12:53:40 -0700
From: Alejandro Zeise <alejandro.zeise@seagate.com>
To: qemu-arm@nongnu.org
Cc: alejandro.zeise@seagate.com, kris.conklin@seagate.com,
 jonathan.henze@seagate.com, evan.burgess@seagate.com, clg@kaod.org,
 peter.maydell@linaro.org, berrange@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v4 08/15] tests/unit/test-crypto-hash: accumulative hashing
Date: Wed,  7 Aug 2024 19:51:15 +0000
Message-Id: <20240807195122.2827364-9-alejandro.zeise@seagate.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807195122.2827364-1-alejandro.zeise@seagate.com>
References: <20240807195122.2827364-1-alejandro.zeise@seagate.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|SN7PR20MB5288:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 38fb469d-2338-42c5-8b82-08dcb71aad91
STX-Hosted-IronPort-Oubound: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ag1ql/U7Vdi6rTK7EbzyDSy27jwHCyvp9OwzbnftU8oEtFHCbj9hYNdkK1e4?=
 =?us-ascii?Q?kOgxINJnaAwSy8dcAx8PDecmdKYeV3S0yPZV1sXeRFiC5RrNUGwzSzbme2mQ?=
 =?us-ascii?Q?yp+ocXyBXn6N8NYFbeqSnPhues94c8mhbM1QBKn8CLs5ZkbL4J9306XEjOkt?=
 =?us-ascii?Q?rQ1pb5fhXetvw4Kdv4qykLSPNozDKhxz9PPgvf7D4rLwlMKLSbgA4di3Rb1k?=
 =?us-ascii?Q?olS/vCbCQRAvBgm05grh1nbNEi72nU1N22n6XVWxXBZYr0q7+XckTX6RbMce?=
 =?us-ascii?Q?XKP6k/z97JABo6V2QZEgCOOsEHhT98Syrni0f0y8KIRaA+Hf83V+yRApzxDg?=
 =?us-ascii?Q?ER3DjPBSrW/zDJjpdiLFM5FthNGMZ7DhL9m8/s9v7vhdaZXdFuZ+9yMoOCF5?=
 =?us-ascii?Q?8YYA0x4/3GDJlhFp4MYXlZt2/SzM+qtdXJt3yt9qVTlF35gHqNT/EHBf77Uw?=
 =?us-ascii?Q?N6i3Wx3hXns5jfferJMB1+W/7WOvrtqG8duKVpsem0A8fGPQaj440MmVpCGd?=
 =?us-ascii?Q?y9vLgibNblJ7n2e/ElkQdmFEQ4X7OWCh0/VSm4CL5bFZ4xjmLlUAjy0/FgOp?=
 =?us-ascii?Q?6z7nUGxnp1cL5lvmWjaQHf/cvlvE4+sOmDaK3R55D/4ApkBkRlkAVP69I4mt?=
 =?us-ascii?Q?WrjiZ6jVqso/kMpkE7LcMqwEYa+pgMQGYj46ruK7Mg7T5e/S529Tp12uVVns?=
 =?us-ascii?Q?b6AcgKmw4HS1AJzot/Ss5pDQ1cbEjWMWfHnDfbMqe3Zzg0sMAPiQd108FLx4?=
 =?us-ascii?Q?sjlvJ7MTBO+gz4KvqYv9FlT2T+waGepeOasqEv78lO9v8/ZyRGkiauuxbW9V?=
 =?us-ascii?Q?RNpVdHDw1D51LnwKorekX2/hEyTnD2duZ9UpuolNiBKWazdgrpeuPoz2vTLY?=
 =?us-ascii?Q?E/7b7BUN7xPDDJBCXsjBSXopFCWjqffZjldpW0LqjZZ22NDdQUKgJZlQsMpM?=
 =?us-ascii?Q?569eUqdfIGz76S6n66I6tCO9UaJZUhVFwEA5FtGHeFdeqSLZ1G11luSnlAxv?=
 =?us-ascii?Q?FJxSiz4speA7YpeiRoNbW5dKUSgE/80XBx4blqc63Dn6liVX/AoUxiRcb2Eh?=
 =?us-ascii?Q?oK0QvOF2hLFHpbB+9V1H6qqLXnGMyMp0ygKYaAetfuUTGwW6mxmVaYPeFKN6?=
 =?us-ascii?Q?JsNW/hHNZ0h1rAErqQifgHpyI1MBxGqJ9dqocvVF8oikFw8JlbI/druKW8yN?=
 =?us-ascii?Q?vb7rH15TRcnFlJSiNqvygKN2gfHpFyp8L//GKnXjrFx99K+9P4qAiCqlNfbN?=
 =?us-ascii?Q?H+yPI6rRHQ3Qk5mpJ/EbIg6L+ae2UFdPvugjn6NgFj/21uiBWgWbUjwzSOef?=
 =?us-ascii?Q?CtXTzMeCyOqjHWba/qCgBhTLiL32Q3NjUcuVKTW7ehRX2/3r2VSmY9er+o9i?=
 =?us-ascii?Q?r4UZkt2cXSefjMUbLUdSMOhO8MMPeFpqYvP19oR0udrblBTVR+CUYpXPKPgF?=
 =?us-ascii?Q?++nFxGzutqdo0KTLMGFAKMqICxq83qA9?=
X-Forefront-Antispam-Report: CIP:192.55.16.51; CTRY:SG; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sgspzesaa002.seagate.com; PTR:InfoDomainNonexistent;
 CAT:NONE; SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ZzkS+se8OqrScZVdU5oYsU5YKduk5A4NGDeHic+IdzM+GPwD/Qtzgzqjz6THabx4fTYP0mc0yLhU/yru68JeZMWw+ubQQJMhrDwFFwANt1H34Dhuo3mFTsc3uz6PNJWO0xNKM5xDXV9xAJpihvWVPgURfhe8QuaVxaAodNqoQe9vApjXBo3CIh4QmMPaa5fCC8ithQGCk4VLlq7vhQILLtrjPhoD1q0m0caQeBfFp+sJWYWxxcSuJao3En7Xunem797sVtyFvaJPAnLSaiSTmrzwm1mkrqTY0PHusw3FYi6hvG/stnZlBFWzVa1+3Qw2PDz1vP0EMdqQOy8hBXw56wV2DXML4Lax2zKCnGfcsg7Wl0O1y0D+THoYLhrPpBHHSMjAjtMEB0lh1oJcuxa364R0nhuHyVRA8X+ph8+8aNRuqSbAbLxxnQPbzGHEtV2dd7minlolrzsJhIHxdxCrTBlC1YDYF/02QJWgC88NAm123VXQVDjDG/RjjiPSSfdjv3PDXzdECSnUBnE9HVT+xQf/DgCMUzsY/ItiLCvQmQzOUl01ETSRNBbxC4xnUAV7NO5y22yf28a9T4AyE5utA6HC6YHAZ5agdW74aXC7Ccb3svho+rCgjdIbjiyp/l4B
X-OriginatorOrg: seagate.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 19:53:57.6609 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38fb469d-2338-42c5-8b82-08dcb71aad91
X-MS-Exchange-CrossTenant-Id: d466216a-c643-434a-9c2e-057448c17cbe
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d466216a-c643-434a-9c2e-057448c17cbe; Ip=[192.55.16.51];
 Helo=[sgspzesaa002.seagate.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR20MB5288
Received-SPF: pass client-ip=216.71.153.94;
 envelope-from=alejandro.zeise@seagate.com; helo=esa.hc4959-67.iphmx.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: VUBu+Yom0dUJ

Added an accumulative hashing test. Checks for functionality of
the new hash create, update, finalize and free functions.

Signed-off-by: Alejandro Zeise <alejandro.zeise@seagate.com>
---
 tests/unit/test-crypto-hash.c | 48 +++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tests/unit/test-crypto-hash.c b/tests/unit/test-crypto-hash.c
index 1f4abb822b..2bf9bcb6a0 100644
--- a/tests/unit/test-crypto-hash.c
+++ b/tests/unit/test-crypto-hash.c
@@ -1,6 +1,7 @@
 /*
  * QEMU Crypto hash algorithms
  *
+ * Copyright (c) 2024 Seagate Technology LLC and/or its Affiliates
  * Copyright (c) 2015 Red Hat, Inc.
  *
  * This library is free software; you can redistribute it and/or
@@ -241,6 +242,52 @@ static void test_hash_base64(void)
     }
 }
 
+static void test_hash_accumulate(void)
+{
+    QCryptoHash *hash;
+    size_t i;
+
+    for (i = 0; i < G_N_ELEMENTS(expected_outputs) ; i++) {
+        struct iovec iov[3] = {
+            { .iov_base = (char *)INPUT_TEXT1, .iov_len = strlen(INPUT_TEXT1) },
+            { .iov_base = (char *)INPUT_TEXT2, .iov_len = strlen(INPUT_TEXT2) },
+            { .iov_base = (char *)INPUT_TEXT3, .iov_len = strlen(INPUT_TEXT3) },
+        };
+        uint8_t *result = NULL;
+        size_t resultlen = 0;
+        int ret;
+        size_t j;
+
+        if (!qcrypto_hash_supports(i)) {
+            continue;
+        }
+
+        hash = qcrypto_hash_new(i, &error_fatal);
+        g_assert(hash != NULL);
+
+        /* Add each iovec to the hash context separately */
+        for (j = 0; j < 3; j++) {
+            ret = qcrypto_hash_updatev(hash,
+                                      &iov[j], 1,
+                                      &error_fatal);
+
+            g_assert(ret == 0);
+        }
+
+        ret = qcrypto_hash_finalize_bytes(hash, &result, &resultlen,
+                                          &error_fatal);
+
+        g_assert(ret == 0);
+        g_assert(resultlen == expected_lens[i]);
+        for (j = 0; j < resultlen; j++) {
+            g_assert(expected_outputs[i][j * 2] == hex[(result[j] >> 4) & 0xf]);
+            g_assert(expected_outputs[i][j * 2 + 1] == hex[result[j] & 0xf]);
+        }
+        g_free(result);
+        qcrypto_hash_free(hash);
+    }
+}
+
 int main(int argc, char **argv)
 {
     int ret = qcrypto_init(&error_fatal);
@@ -252,5 +299,6 @@ int main(int argc, char **argv)
     g_test_add_func("/crypto/hash/prealloc", test_hash_prealloc);
     g_test_add_func("/crypto/hash/digest", test_hash_digest);
     g_test_add_func("/crypto/hash/base64", test_hash_base64);
+    g_test_add_func("/crypto/hash/accumulate", test_hash_accumulate);
     return g_test_run();
 }
-- 
2.34.1

