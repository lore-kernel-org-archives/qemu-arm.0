Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9395002wrt;
        Wed, 5 Dec 2018 05:44:10 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X6hRNkSy2/GrhGDZLpVN9nAjb3CIEaiIFom8R+SUR9WDKyfRDhL1MPGvtAZssCb1ndatTb
X-Received: by 2002:a0c:8aa8:: with SMTP id 37mr23748978qvv.23.1544017450328;
        Wed, 05 Dec 2018 05:44:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544017450; cv=none;
        d=google.com; s=arc-20160816;
        b=OYgFNr50V0sCzyE2A0fx2OffagmtN4wkSF9CxnlwnF7v2SZanZ0b1s6D2FbMKElFUe
         kkkZW4fOYydmfLI9VyxKy/tuPo21YW0gEu3KN72ZwofPohwLVdE/2DORBzAeugN3ydzq
         oCCKsi+kqKgYB7DNo98AmiMKYDROPa9Xvt4PutFYpxbBMwduldYgZ9DOvuhRVb5+3gkZ
         dCg2Bn4etJfhWjkHQtGYZ/yU88cRm9rMl0p41Xz3gYYMs5eofUipJJJGgIrMIHl4X+Uv
         AGy3Ixn8s2BnhCKR2WqLTNv4pI3T1C7LHSPqr5Ijmp3XjFRYMmXuza+miVLX7/1CaRlU
         WBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=dfhnBWg1neMbWdKiMWNOsmbs/bDPQa+vm1S8RllOBgs=;
        b=oBccMkM6lMseXuRJwl4C3y22zUqkv3M8tZFIhml9ERu6d/oP0vhwkcHeS2QyGzod0v
         9NamLRtqCgLKAOps/d0PCcfuAKPV9JL3WMkUk+OLwpxYwwLltNJC5OH4wXkPXTehdGIZ
         ESd+u14u0O2mAG5fm3YoZPnXPww9S555BHwcNBiN3dUEWlUq3JJyC5Vi0Q0h1J+rdU5u
         F6AnOnAvuc5/CGmHf0blFy9IywEMpf3jBgEmkTcHXb4MQcb2rj5U4DcF/KjaxNqiBP9B
         f9Sy+/9XSOHjQMhSPEUFNDH1c9nENnftM7RiotnyImhbt/9qHWYERnl8EXqctac2NqVB
         bZEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=o4Eq43JN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y11si5722883qvp.98.2018.12.05.05.44.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 05:44:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=o4Eq43JN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:34576 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUXTF-0007fz-OW
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 08:44:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXSb-0007Za-Up
	for qemu-devel@nongnu.org; Wed, 05 Dec 2018 08:43:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXSa-0004mp-U4
	for qemu-devel@nongnu.org; Wed, 05 Dec 2018 08:43:29 -0500
Received: from mail-eopbgr700125.outbound.protection.outlook.com
	([40.107.70.125]:10909
	helo=NAM04-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gUXSU-0004aK-75; Wed, 05 Dec 2018 08:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dfhnBWg1neMbWdKiMWNOsmbs/bDPQa+vm1S8RllOBgs=;
	b=o4Eq43JNt8of2hmaxCXug7h32P2uiS3TuVt/s2gQTCcKRAA5cKxJsamL39Zs8+523BA8Ih0zMPpmBOj3Dr7GH6L5YdjjLlgAY5o4V72Yo9pakoavE9QP9CmWXT27bQ4q+tSo9ryaGeXSLVF+E+OTKStX7Bud5iuzAsDCjKZsdGI=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4700.prod.exchangelabs.com (20.177.217.81) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1382.22; Wed, 5 Dec 2018 13:43:14 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.016;
	Wed, 5 Dec 2018 13:43:14 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v9 01/14] migration: Add post_save function to
	VMStateDescription
Thread-Index: AQHUjKB4yng9e82I70y00XzHz95LXQ==
Date: Wed, 5 Dec 2018 13:43:14 +0000
Message-ID: <20181205134243.4791-2-aaron@os.amperecomputing.com>
References: <20181205134243.4791-1-aaron@os.amperecomputing.com>
In-Reply-To: <20181205134243.4791-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR12CA0032.namprd12.prod.outlook.com
	(2603:10b6:405:70::18) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.155]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4700;
	6:jJ5iiRbPAM1/oRz0XgTwpfB0w5oWeyaq/FTQo+s716omMCxdmDmw9uAQNOTjdj4FSQzkBJhtf1Y5l5Mt+RvYJYwTn+EpJMQS3EHNP747NU+LXowQyhpreUUgB6yW91RhUHnakC4k9kFQkCfMZc7PLLvaH+3WmGSxkcC09kx41WdNuaSDnVfGrdvutuOWzke5yySzIW2ghITRQki02FIJlvOz5QTbdWRsexaXKmqOMYxUuVvRGxiOCHcQA9tkWM13uj/XJXPlVfVDSQhdDJiymYDzpJWwimvgKwdF5zZxo4hZqeYE/YhJW1LICKl4DuOWUSafjvLNZw/2cvnH2v7pVeBye98s4CWCmr5qo8fbuo8bk4D+Kg3vhCa7MxkFmqDQz1V7yuIp2a3u2ztBcSeog15eJsKC/zHO3wI2gUEsyKL7+HHoa/qXnJjoQc+PhokffCkeXVE6n2Nvt8Ut5ZtCrA==;
	5:DrrEgCT3LK/SYy9c8bWYAs9wliNxf4JQYdli3tbypFzZu+e8rBILZRf+CuoQFyfqw0HhLwzLrFR1AnEYL5A3Z2JzCPTMFfmDZXaRhHgdizGXZS3q0/56tvRjcIMKEdneQCNh6mQvMrU0lI6V3aCCsHuSBkZpQa4YhzJec60hgFs=;
	7:o4Lkcli4sVn5UM++1g4QDhAZyHEWihf2WZiMvgb14zV816LYMXfen5EpD8LdzRuwz+XMgZFujWTR/Y5ypLzMmn6ONhJVIjY6puMU/930F1RSoeHIPegiSq53bw/d9sd7aECNOt1shzjZEhk0FmT1qw==
x-ms-office365-filtering-correlation-id: 250f5736-9fa5-4cf1-5ec5-08d65ab79ae7
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4700; 
x-ms-traffictypediagnostic: DM6PR01MB4700:
x-microsoft-antispam-prvs: <DM6PR01MB4700A758F0E1B1E10CFFE6168AA80@DM6PR01MB4700.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4700; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4700; 
x-forefront-prvs: 08770259B4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(136003)(376002)(346002)(39850400004)(189003)(199004)(386003)(2906002)(6506007)(2616005)(476003)(97736004)(446003)(11346002)(486006)(102836004)(14454004)(26005)(99286004)(106356001)(3846002)(186003)(6116002)(1076002)(6436002)(81166006)(81156014)(8936002)(54906003)(316002)(86362001)(68736007)(6486002)(25786009)(8676002)(7736002)(7416002)(110136005)(305945005)(2501003)(71190400001)(71200400001)(4326008)(39060400002)(76176011)(66066001)(52116002)(53936002)(5660300001)(256004)(14444005)(478600001)(6512007)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4700;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: Lq9ze69Lkjime3vbgTeETftv5qNdLu3FAfdinbRJZdikYuuchU+dYGh1/M3QEhECyfOiEzEnr2jW50aBNaScPUgyq8vqwMwiw6nnxZXCh0s69RF/bYkDHiMAe313YTltFOfne/2qDp47EthIvbeEkZcE1FMVITFltDlfAi2pFxqdM215AteFStWu4+JVOauNAK4PPUPHNsRTmgScVwlFX9a2+mSP8RiU9RQKTH6ihX+DXzaIDeJMd0BwKGZyUPGFQRvWm3QpR0WGYxNm7SB32/Bt60BSqoBLt/OkTWP07anEujS3THtBeLDLd/1UMKrNbYi2zBdq9Cxewl14n3UcLlJwn69Njj52wQASkjRzIfI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 250f5736-9fa5-4cf1-5ec5-08d65ab79ae7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2018 13:43:14.6216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4700
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.70.125
Subject: [Qemu-devel] [PATCH v9 01/14] migration: Add post_save function to
 VMStateDescription
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>,
	Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ykjjwfg8l6M8

In some cases it may be helpful to modify state before saving it for
migration, and then modify the state back after it has been saved. The
existing pre_save function provides half of this functionality. This
patch adds a post_save function to provide the second half.

Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 docs/devel/migration.rst    |  9 +++++++--
 include/migration/vmstate.h |  1 +
 migration/vmstate.c         | 13 ++++++++++++-
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
index e7658ab050..220059679a 100644
--- a/docs/devel/migration.rst
+++ b/docs/devel/migration.rst
@@ -419,8 +419,13 @@ The functions to do that are inside a vmstate definiti=
on, and are called:
=20
   This function is called before we save the state of one device.
=20
-Example: You can look at hpet.c, that uses the three function to
-massage the state that is transferred.
+- ``int (*post_save)(void *opaque);``
+
+  This function is called after we save the state of one device
+  (even upon failure, unless the call to pre_save returned an error).
+
+Example: You can look at hpet.c, that uses the first three functions
+to massage the state that is transferred.
=20
 The ``VMSTATE_WITH_TMP`` macro may be useful when the migration
 data doesn't match the stored device data well; it allows an
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 61bef3ef5c..067b126cf1 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -185,6 +185,7 @@ struct VMStateDescription {
     int (*pre_load)(void *opaque);
     int (*post_load)(void *opaque, int version_id);
     int (*pre_save)(void *opaque);
+    int (*post_save)(void *opaque);
     bool (*needed)(void *opaque);
     const VMStateField *fields;
     const VMStateDescription **subsections;
diff --git a/migration/vmstate.c b/migration/vmstate.c
index 80b59009aa..e2bbb7b5f7 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -390,6 +390,9 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDesc=
ription *vmsd,
                 if (ret) {
                     error_report("Save of field %s/%s failed",
                                  vmsd->name, field->name);
+                    if (vmsd->post_save) {
+                        vmsd->post_save(opaque);
+                    }
                     return ret;
                 }
=20
@@ -415,7 +418,15 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDes=
cription *vmsd,
         json_end_array(vmdesc);
     }
=20
-    return vmstate_subsection_save(f, vmsd, opaque, vmdesc);
+    ret =3D vmstate_subsection_save(f, vmsd, opaque, vmdesc);
+
+    if (vmsd->post_save) {
+        int ps_ret =3D vmsd->post_save(opaque);
+        if (!ret) {
+            ret =3D ps_ret;
+        }
+    }
+    return ret;
 }
=20
 static const VMStateDescription *
--=20
2.19.1

