Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp708280wrt;
        Tue, 11 Dec 2018 07:20:45 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VV6MNxZCSA/d4AiDqcbVBb7LUqLmANnUQtG8BJ9iPH0pN5DSoBlqqj3yxraRBa2x0Boa10
X-Received: by 2002:a37:e84:: with SMTP id 126mr14380592qko.177.1544541645660;
        Tue, 11 Dec 2018 07:20:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544541645; cv=none;
        d=google.com; s=arc-20160816;
        b=ZE2Ps180ORfWOv5JhvmRZctum/1D9njqO2pzktW+wPngy58IV8suQ6q7TK0CYsYgvk
         5mA1jZg68N60Hf8G8qUYgOqrdyoeEVnkJgzkZE6K2KXtdQVjQx5pc+6GoaRPTlvJQYrk
         rBwtHKhe+q8EEpqSWRye/BKglg+HnikXNAhgtUmWhalJJxiMh/e4kHbukPGdTetDBDsf
         2z9VdaFGv3qIVmsmcDH+k5dBLzzCQecWwbD7KXxW7RcC/mkLKne4fQ1jIYzxGg6Qn/EL
         rkQdoqCvs/Vocl1NPTRUKvD0sxTOn7IU3YAOVcMOER75hJpjTaXoKTi7QqosTonbl3x7
         fPaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=JLZoWPhYZt6bafKK4UWlY/29b3vxexsevN6NLPyIGWI=;
        b=ylrLwiMwWGeM779y0u/ZTYDZu4SkD8VOoUjK/aW6UGQncGxAWVdDyaB24KeFyknfs4
         9oioAfeVAUQNBmzj3jxjI1uaPg2yEzSTupgcEODf548eVvn1TfuLq1fq9MZK2HSVntEc
         07mP2iyACEhBXSdWODIlcFoBJTkGklYPxmGqzCk+bECdgxGtSKfJz2lRaJ2u3jXYB+vU
         cLFmua50Z5ST1Sfs8xLYKLBNEaVXhV57BuQrEquW2bJ9GHV7SdiV+8ch/Q7sljbXRnkX
         Aj6d5w61Cy5IFyT7y0lyL5RsAMPoeZL9l78bfdGaPaY4J1Oh+ForEc/hBMJKh00KPSsC
         7qEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=Jwmvl1QM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j35si6381860qte.348.2018.12.11.07.20.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 07:20:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=Jwmvl1QM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:38617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWjq1-0003tG-34
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 10:20:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjpj-0003pc-U9
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:20:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjpi-0001NG-Ts
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:20:27 -0500
Received: from mail-eopbgr710107.outbound.protection.outlook.com
	([40.107.71.107]:42240
	helo=NAM05-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gWjpi-00018w-Ii; Tue, 11 Dec 2018 10:20:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JLZoWPhYZt6bafKK4UWlY/29b3vxexsevN6NLPyIGWI=;
	b=Jwmvl1QMZpc/kKA/5Zk5droqAFFaRWDMb5nZ3IxSaGv7a7DBJKJtmoP9SloAlhtdWQZaINdOnNT0akG+IyGIDJ2Eyz5pqV2nG1OAiDzrI25GHEkoco3DfAraa4g53JYk7P4Gbz7O4KYChX6fSgQpq4mCUyAabuYpBewN23lBph0=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4379.prod.exchangelabs.com (20.177.221.214) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.18; Tue, 11 Dec 2018 15:20:11 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.026;
	Tue, 11 Dec 2018 15:20:11 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v10 01/14] migration: Add post_save function to
	VMStateDescription
Thread-Index: AQHUkWUCpkFUgS7AC0C976Pm0s6K0w==
Date: Tue, 11 Dec 2018 15:20:11 +0000
Message-ID: <20181211151945.29137-2-aaron@os.amperecomputing.com>
References: <20181211151945.29137-1-aaron@os.amperecomputing.com>
In-Reply-To: <20181211151945.29137-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0041.namprd11.prod.outlook.com
	(2603:10b6:a03:80::18) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [65.190.6.212]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4379;
	6:iCSgPu0WHgilQ4G13xIYj5kHoigIM8P/AnsyyMxEFD5igEwAIyZXCvIKleJEVvuz303OFQhAiU+KqKMQddv8iI+1AGqjg+W56n1XFBR9DAjZPY3Ysh5wRN32YI496tb1igweWnxgyflQiDyYXHTB6A691wAt3l8YFjSK1oQckN8BgyVXODuOdNEKj5bjyDpOvc858Tb/A8QbzVgjQgffEfbqH/dVi2yLAfLBEJwoEGWeOxTaFJqXQyiRGbocVADt6r7XYFSnMeHY9a2gX6f+8JpBkKpdqYtyNBuSDcmjV3G4mIjjFf1F4qVx2hwqt0yljKrGeqhwuady3MyPTlcXbHZSVBOo4hjk3s4N/ydTt6M47eIXWTaexv33P8z7B0NdtvACluHeYDv9V0nYQa0sVI7ln/d0WCIo/wanvR/xclXDD24acMrJ9yzexjMGsVPHPpfc4uwPwIZ2Y6tAyqhN6Q==;
	5:oE0rB4EmjmXsC5BC8cQq2MCPnGeJPKjCk80icB+fEUt9ARbkcbkEuJzcKXAEhnNgpI22XvXDv+W4Jzsk9KNRFCaoe6ts7HTvXvTK4tPRGN8TrR6DiykkPQDx6SeVIdusz5lAamffAIcTbxIY8Uo7I7gyZD+6D/iGgQytg1Po9Lc=;
	7:Da1IJiNt9u/83wjqcRTcoc3wBanlOzkRnXvDZGZ4T2/g5Vtmic4UWXgu4CVlILUcda6FTLA6zzIUHJ3sS8To3E8PIzKspEqU66dCi/9wCGqaNkxEJ0FC+YeER2+jfzEAFtBeKhMKofokMKrQNzT35w==
x-ms-office365-filtering-correlation-id: 9d4e33fc-837d-48dc-da88-08d65f7c2478
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4379; 
x-ms-traffictypediagnostic: DM6PR01MB4379:
x-microsoft-antispam-prvs: <DM6PR01MB437955457EFE21A2EAF642918AA60@DM6PR01MB4379.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(10201501046)(3002001)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4379; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4379; 
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(39850400004)(396003)(346002)(376002)(189003)(199004)(4326008)(26005)(81166006)(81156014)(71200400001)(71190400001)(106356001)(6436002)(66066001)(14454004)(68736007)(3846002)(2501003)(102836004)(8936002)(6486002)(8676002)(97736004)(6116002)(186003)(446003)(99286004)(476003)(11346002)(2616005)(25786009)(7416002)(486006)(7736002)(54906003)(305945005)(39060400002)(478600001)(14444005)(256004)(52116002)(2906002)(386003)(1076002)(6506007)(105586002)(76176011)(6512007)(86362001)(53936002)(5660300001)(316002)(110136005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4379;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: Ki8OuDFqViMBtyFviIN8D2ghmRRwjmIot9EkuWgZ7DBguS1jJu7b875pYxHR3GE7jpnp62WEggwtrIaaTXcdgMwe6uFepOQ/yamixFE7TsNCRUIy/+JWVAoMLvyyxRUxeCKarU6WxYdoG3vd+jlsAOD9xhuKAOytf2TDlxF8AgumJuD2XtPBE5cAl065RC6TySVRq0NMvO3ahx+zEOmldgsltrKpHCFCIMkew82pgh1xXIIeyuTcyzrCvb8baIXyTQ/e3erpqplvtJbT1Wi0vOh3jF/v8D7jvIrnvK74Q1GBxMrMr4qBaiDLf4wJpf14
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4e33fc-837d-48dc-da88-08d65f7c2478
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 15:20:11.4799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4379
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.71.107
Subject: [Qemu-arm] [PATCH v10 01/14] migration: Add post_save function to
 VMStateDescription
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
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>,
	Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: agxJF6E7sSq4

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
2.19.2

