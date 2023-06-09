Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp534677ejb;
        Fri, 9 Jun 2023 10:24:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6l0SzAsJfWYG849h8yxPT1imsIj5NM+cUMYR24dx65Q/CC7anewEtFeCCP3qYYZsCm0dQP
X-Received: by 2002:a05:6a00:c94:b0:661:a374:767a with SMTP id a20-20020a056a000c9400b00661a374767amr2316674pfv.1.1686331444912;
        Fri, 09 Jun 2023 10:24:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1686331444; cv=pass;
        d=google.com; s=arc-20160816;
        b=wzpvhMnKSN+RMWUS39MB/1eU1sx+rSlB95J5oAbQnMXuNiooVnYqECHcGpbH/0kZyg
         yng2hD4BiS2YLa2Vuwmv88xvDjPw9v0bK/RE0ks+xejcEC90yZlimytNBhjkYcBdiWbk
         jJI0vynZpRBk6gTE5Eg/vujJXNK3/NrpYBc1RidnfEX1Pmf9XGHbR+jSCGevIcn7XxVn
         Qw/wUmn0aCcAEntDU4wjXdKf0YsTKLArCwcZUxO4m6D0cbLZR+lnlEk3Au2t5Fy68tQ1
         C8BS4vgjrG38Re8pSVfX3EcrVttbmsGNpG9bd/gYhWFmjoyIg+nXHQ+Tqx5UygVkFTL/
         +9jw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=P1kbDTRaTIHfeSas9aW3ZAgj6q6/NhKSeWXCBp/H67U=;
        b=PWMieFIFnbWVTtOX7ZW0dxVB1YIesgWXudhCd0RIYltDSkzoDwWpQ7NxQ0wSCnkRTY
         GViugSH/VxV8whIkkPFh3+lWze/gJUO292v6KDpmcIjK77/5a0lbCQgdEXCEQJdm/qp1
         IcdQcD///1rzKeZLarh1xlHdtT0ItPJQ0BYyaV7ZIOhDQuOnrDiB5ycfLaE/PD0b5tat
         hgl3To92DpBbms6KpAXlQVRlJCw0l5Ltbtr2e5yltYL0w9Zbu4H7ghHG7kbxQsIlC0Wo
         Y2Uvfm+8azgUgLW98mVkBrC5Lt5LcJQ9+aG0k0GDxscM0q5+0EwLqI5B085DL7aRPSeF
         5klw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b="pYW/iGtg";
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8d::700 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <aaron@os.amperecomputing.com>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on20700.outbound.protection.outlook.com. [2a01:111:f400:7e8d::700])
        by mx.google.com with ESMTPS id a184-20020a624dc1000000b006519ca72dc6si2716520pfb.161.2023.06.09.10.24.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Jun 2023 10:24:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8d::700 as permitted sender) client-ip=2a01:111:f400:7e8d::700;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b="pYW/iGtg";
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8d::700 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVlgWAzMHMh1dLrwMyYWp+re5lrm3n2E/F+YUbhw7sR6ldNUvShWWTe2GvNU8f8C2P3Ym8fOmaG4z9jKUJyHjboWdb72V4cigBPPf4foHXFOxENF6Y28nLjk4AwGj29PTLry+2jE2m1naxseAFiJPIyttwr41qMMT+qXAnHeLN5x29ojt9uq+EBRFTteR89E/KBqpLz3BNCS7/FG/divn6TAbV1Rqgm1XZuFwCsms6riTJoztqlFbAlQf2I9JjO6dZ8JCqgEIlaTAPjC4ev4TX3eXJBPFvqqVpxG5FbPqZhysarJ8Kzhz2ZuDfE/fNWUNsSO0MWWhh6wScDIhL8N0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1kbDTRaTIHfeSas9aW3ZAgj6q6/NhKSeWXCBp/H67U=;
 b=hw2/RgzNLhAlbNC8iwTYRb7Feb6HQw3PPHT287twGek9vfBXjuMesXoGkhW0oSbyQB7s9LrVwxa5FWizKKhLK00RXGmfzKrnAqctNxZSZgCv5EEnWsYriF/ZuUKjETmzioLPqvTkHdct1/g5sOrO3Vvhh6V9pS2JK/k7L1ZK7VgsBel4Rx9Tm/DWZESYkJ1gwTIC+V4zE5C5gE30dgHUEZKIYFcD2b3RtNqHboV+aCMelkbuy0w/Bhwl4D06zJ3NzTQP6JJhMJcd9HlqW1WFJ18Ur5D3ZE8NrgLZ2Mgkd3QU89gtLmu6OozJ3FXQSAqZI5iBpTxVzy2Yg+4JLTl4NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1kbDTRaTIHfeSas9aW3ZAgj6q6/NhKSeWXCBp/H67U=;
 b=pYW/iGtg6NhokDN5dOdmcLYfRvr6nHQff/1KLDHXOfi3Cgu9ZH5P9dSlJyt04aC2f7YCrmI8IeNHbMB9KGtWnhLNDBHPHYFxa4LLUkaX9VV+p76U8PCAcB0Dbf7K8OAaRlkdSxwuI8ZnBJQNLO5AOYaeenwmbV/69N6Rq1kVx20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SJ2PR01MB8126.prod.exchangelabs.com (2603:10b6:a03:4fb::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Fri, 9 Jun 2023 17:23:52 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::9a78:4703:c6a9:16ed]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::9a78:4703:c6a9:16ed%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 17:23:52 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Vincent Dehors <vincent.dehors@smile.fr>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v3 3/8] target/arm: Implement v8.3 QARMA3 PAC cipher
Date: Fri,  9 Jun 2023 13:23:19 -0400
Message-Id: <20230609172324.982888-4-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609172324.982888-1-aaron@os.amperecomputing.com>
References: <20230609172324.982888-1-aaron@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:610:b0::14) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
Return-Path: aaron@os.amperecomputing.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|SJ2PR01MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc00ce1-6099-469a-cd29-08db690e4ba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aWBaEougsNhOWxROyOW/o6PZNrtbYenS9fvycjml+1C3XCviaJ+0pWZdb5VhNnk+3tPNLYNAxypgCU8g6zN43bykvD+15YDK2KFft0lNb5beEdL5nPLTXlD3ppWkXtdUWpq5ZzptGDyt6YaLwzWodublrtPbqDUiwQugERa2KjyTXiokr+7eR+tWkWyIOiVVcYRQSZH6/Xyn/M6mDt9EnUg2xw1eQ5tm7w6vKpyzuWFVB68/QgGg0b0tsGNUyQEAyvL4Y6iOKvYIi8pA4MbNachoxbne69QZKGynAzCs1ns+w4Gco/Ir87QuiqZHQFW8aA2tdHS3pDbro+Ptco6suc5ZPPpZvjnROWbl7K+KDrUebxPrhxu75a7zIcC30vi3wmGe0v2QQFauWkPdtXPDYlx4mjthbuePqTSZrRcDudi19H6gvSeLJYR9r40tImFVrC7CAu//oTV8j4OaqTfQXdaQKq62m0+aLFfzMzB0V8MZksPnCqpb52P0U6RZfE/uNfFN0C8YupT1BpI2eIJW93sUuFA8wNwtH56yRYOdi3NkE2GmX7nwNPam4OU5c6uZwEJIU2seyVpOlbb5sTRqvnJkUJIm9YtpVHhwr1f9AS867bPP2V3i6ObERiFayQoY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB7124.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(136003)(376002)(366004)(346002)(451199021)(8676002)(316002)(5660300002)(66946007)(66476007)(66556008)(4326008)(2906002)(8936002)(41300700001)(110136005)(52116002)(6666004)(6486002)(6512007)(26005)(1076003)(186003)(107886003)(2616005)(6506007)(83380400001)(478600001)(38350700002)(38100700002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2dfq56jw9ihIbeLkd/azurYiEfn3ZSVkA4X44pWb0oqfrWq0Plo7v9WSb0YS?=
 =?us-ascii?Q?x2eaBLby/x3F9hirbgTdljF24PjjFfxpSl45nNUerdSNVS1V9ymA31u8LHz2?=
 =?us-ascii?Q?yf4tlMfm9xz6+DeKHaA51E5R5rhwv3IeEm5S8iUheFYrQ7LKtgmtIaUnJPDE?=
 =?us-ascii?Q?at+vPduF3wNsXbp9KH2sHxQqFGk+0SXms9UnH6vOe33iqXHQfBaUb3QFhTe1?=
 =?us-ascii?Q?o+g1hdFg5VEg4QAHICAUwIWeV6jjSnqt0tX3KO4UunhXrzDwR7IlXBlR4Rkk?=
 =?us-ascii?Q?6fjAcHyZAj1BFwRse2e3D3JYONbVBjcWGnGdhTshHG2GxalWGrgkyUB/eocA?=
 =?us-ascii?Q?4Lme0oVfV/DL51t//GyAg6Sh4B8dRV1N/F9G0U4zI1OPO34C+gjPl7mZ/Peg?=
 =?us-ascii?Q?YRd99RMFMzQSd1Wg48yH+wsEY/e8r+coMbx8q9DklGopMY/dnkPDeFicWIIL?=
 =?us-ascii?Q?oYQ0sfVSJZmzXHZdQuBy/QR/y9SDTgyPNJFGISG5jh8t9ti3JP9IMMCCosJp?=
 =?us-ascii?Q?GZXvXepqqcYsak5UO5Xmsdh4pC6HvFZJD9hI0ePsnJK/ZADYEjrGjsxuecwY?=
 =?us-ascii?Q?Yyu/nQ4+vKdVoej/G3nuNoSSnaAJQCdsegl4J+APBGiWmi9aNbEWymf5Wa+j?=
 =?us-ascii?Q?fxi58DpHbNgEalAxNnf3HmlulF6l8TAkHy7JyrJJgfIhHp+IlGrzTIcposLS?=
 =?us-ascii?Q?7ubqmv2d8ogLNAdCaHmXJvhXJYR2SnU97W6hejpoC6rDUNNx4VU1REi660N7?=
 =?us-ascii?Q?/OKK1GievV2ZNqZ4Lawf7dtdWmwJ3MGc2EPDIzo3k1XKhQTEuEYm45cqsHTK?=
 =?us-ascii?Q?4tni7jO0ThFAOOGTj6uCpnOSW7XIMTW+iHqvI5dTQHeUSdxgfEfBZf456Kcc?=
 =?us-ascii?Q?QnlDVC/M3fayiJd1QmvTs6r1MBzw1dA8WdVp6zfq92wIt64PT+YC6GEB55g9?=
 =?us-ascii?Q?hpruHGS2P9/lQuMorONROnJ9N0yqQTle7ctcbv3uNvRuT8M7jjEpcmskTY3m?=
 =?us-ascii?Q?PBezIWhU2hKgOIeHvYKWaIhUGEIgozKb3cFL7Wzj1+zfZfoVSdKFzeqGLG40?=
 =?us-ascii?Q?0exj3naVHF67uiSY0N7HBTUoV88Qb0Z4oGo3QH1DFOvC8fCR9iNwJw2pVFR2?=
 =?us-ascii?Q?nmIR4ujpHLHQDrGNFSHW/GLwgtRNCyqhOvx5KgqidrJrzbicqESvB7xN4KPG?=
 =?us-ascii?Q?9hf7P9j4zIo6OT/QbdgDfr9S4skm5ivBJk6ZS0Paa9Zo5sJmTFZDZAbl95aR?=
 =?us-ascii?Q?FB6FVTT9Ctyf7FDgk3D8wFJOHqKAipgo8k7Y7SHabqLqlK50hAg5vpTeKkjP?=
 =?us-ascii?Q?iEb6ocvbwsM/ywxgcyGOjQVPM36WVRa9Fqia9y27i0ZZZSosvA4787cf74Rc?=
 =?us-ascii?Q?M5XUQMQENnnSgOxeLI+3+Jr3ybWPmmaP8i5So4k6SzoMarLmov/IGeewOuSp?=
 =?us-ascii?Q?22uYlBrPc3Z+gfID3P5qsJBfyS+1o0syDAG+f9Mrz1RT7xkMCbMcX1iBb63V?=
 =?us-ascii?Q?gNnfZdshe9/1PYqzNaZ3S6lGR2OORm96JvaK5XWOBAlDy2cazl6nASTSRM86?=
 =?us-ascii?Q?BQcRbUcssRC6PZX/gsx/MylLdF9082Zg8yPbn2A/UBLGQ5yNtth1cb/Aedxn?=
 =?us-ascii?Q?EhH0Sr5MNgzBVKFTTyZ7RCE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc00ce1-6099-469a-cd29-08db690e4ba0
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 17:23:52.3614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Poud8ELomvAxpzBXY+7uaaSbmTL5ugvOdSAETx7dNyN8L+CbBNMECFNb7F1vaJKSeAErdj+AjVfs7abqBx5rJxQJ1/FiiaVU4Jh4qzwT0ipZ/6F8FUApW9Od4Sj62s/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8126
X-TUID: e5aq1YuFjw2b

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/pauth_helper.c | 54 ++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index 3ff4610a26..68942015e1 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -96,6 +96,21 @@ static uint64_t pac_sub(uint64_t i)
     return o;
 }
 
+static uint64_t pac_sub1(uint64_t i)
+{
+    static const uint8_t sub1[16] = {
+        0xa, 0xd, 0xe, 0x6, 0xf, 0x7, 0x3, 0x5,
+        0x9, 0x8, 0x0, 0xc, 0xb, 0x1, 0x2, 0x4,
+    };
+    uint64_t o = 0;
+    int b;
+
+    for (b = 0; b < 64; b += 4) {
+        o |= (uint64_t)sub1[(i >> b) & 0xf] << b;
+    }
+    return o;
+}
+
 static uint64_t pac_inv_sub(uint64_t i)
 {
     static const uint8_t inv_sub[16] = {
@@ -209,7 +224,7 @@ static uint64_t tweak_inv_shuffle(uint64_t i)
 }
 
 static uint64_t pauth_computepac_architected(uint64_t data, uint64_t modifier,
-                                             ARMPACKey key)
+                                             ARMPACKey key, bool isqarma3)
 {
     static const uint64_t RC[5] = {
         0x0000000000000000ull,
@@ -219,6 +234,7 @@ static uint64_t pauth_computepac_architected(uint64_t data, uint64_t modifier,
         0x452821E638D01377ull,
     };
     const uint64_t alpha = 0xC0AC29B7C97C50DDull;
+    int iterations = isqarma3 ? 2 : 4;
     /*
      * Note that in the ARM pseudocode, key0 contains bits <127:64>
      * and key1 contains bits <63:0> of the 128-bit key.
@@ -231,7 +247,7 @@ static uint64_t pauth_computepac_architected(uint64_t data, uint64_t modifier,
     runningmod = modifier;
     workingval = data ^ key0;
 
-    for (i = 0; i <= 4; ++i) {
+    for (i = 0; i <= iterations; ++i) {
         roundkey = key1 ^ runningmod;
         workingval ^= roundkey;
         workingval ^= RC[i];
@@ -239,32 +255,48 @@ static uint64_t pauth_computepac_architected(uint64_t data, uint64_t modifier,
             workingval = pac_cell_shuffle(workingval);
             workingval = pac_mult(workingval);
         }
-        workingval = pac_sub(workingval);
+        if (isqarma3) {
+            workingval = pac_sub1(workingval);
+        } else {
+            workingval = pac_sub(workingval);
+        }
         runningmod = tweak_shuffle(runningmod);
     }
     roundkey = modk0 ^ runningmod;
     workingval ^= roundkey;
     workingval = pac_cell_shuffle(workingval);
     workingval = pac_mult(workingval);
-    workingval = pac_sub(workingval);
+    if (isqarma3) {
+        workingval = pac_sub1(workingval);
+    } else {
+        workingval = pac_sub(workingval);
+    }
     workingval = pac_cell_shuffle(workingval);
     workingval = pac_mult(workingval);
     workingval ^= key1;
     workingval = pac_cell_inv_shuffle(workingval);
-    workingval = pac_inv_sub(workingval);
+    if (isqarma3) {
+        workingval = pac_sub1(workingval);
+    } else {
+        workingval = pac_inv_sub(workingval);
+    }
     workingval = pac_mult(workingval);
     workingval = pac_cell_inv_shuffle(workingval);
     workingval ^= key0;
     workingval ^= runningmod;
-    for (i = 0; i <= 4; ++i) {
-        workingval = pac_inv_sub(workingval);
-        if (i < 4) {
+    for (i = 0; i <= iterations; ++i) {
+        if (isqarma3) {
+            workingval = pac_sub1(workingval);
+        } else {
+            workingval = pac_inv_sub(workingval);
+        }
+        if (i < iterations) {
             workingval = pac_mult(workingval);
             workingval = pac_cell_inv_shuffle(workingval);
         }
         runningmod = tweak_inv_shuffle(runningmod);
         roundkey = key1 ^ runningmod;
-        workingval ^= RC[4 - i];
+        workingval ^= RC[iterations - i];
         workingval ^= roundkey;
         workingval ^= alpha;
     }
@@ -283,7 +315,9 @@ static uint64_t pauth_computepac(CPUARMState *env, uint64_t data,
                                  uint64_t modifier, ARMPACKey key)
 {
     if (cpu_isar_feature(aa64_pauth_arch_qarma5, env_archcpu(env))) {
-        return pauth_computepac_architected(data, modifier, key);
+        return pauth_computepac_architected(data, modifier, key, false);
+    } else if (cpu_isar_feature(aa64_pauth_arch_qarma3, env_archcpu(env))) {
+        return pauth_computepac_architected(data, modifier, key, true);
     } else {
         return pauth_computepac_impdef(data, modifier, key);
     }
-- 
2.25.1
