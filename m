Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2942791wro;
        Mon, 5 Nov 2018 10:52:14 -0800 (PST)
X-Google-Smtp-Source: AJdET5dfWzc9kqmzYffOzEFXPtMSQQpzN1q3ny3C1ce9mN+opM9D9VR72pgkdYTjuP4YjxW9aRrd
X-Received: by 2002:ac8:18fa:: with SMTP id o55mr21157123qtk.256.1541443934040;
        Mon, 05 Nov 2018 10:52:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541443934; cv=none;
        d=google.com; s=arc-20160816;
        b=f3RtalEkfzHfLAkb0WaadKRrVf9HqzRdqrNFpC2ErChuqU+V7fTzHOvsSUUXNvVafw
         dcvMfAISJQuj4EetQprPpzUpz7Vxxy2CaKOQtaUsfp5C1sL2z8MJ+0iUjwUYSbER1Kx6
         ICn7wxU3GyAKFkQz3DJB6C50v4UsRFyP3Az6CNoNYgZz0APqa/1Sje6CyX0OERNJCrNX
         jm8z1N5VhOcWLdlNO+oDOSFAclQzE5S96NapJtKnpR7jcvEmJYZzDE1v5oXaYp3EsZCk
         NeJ6722EAgTNR+2UsDS8d0yCy81NI/01rEal+BlR83TBstaCK+wsLVFMgp2rj+SQ+4Kw
         F2tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=STKh8Eqo6HA18AmpdKl/7DJjvk/NyLNwlfv6QlRGaqc=;
        b=b64HN3yfo8WQ601BMw8gdBpLliOkox7I96MpzbiLVSEP/3bGxKUzD3KJ7eXXnM4iCU
         Wc7savMWYsyDdqxvf/GN75urM8XNirWC8FDgUDkbuSDReZ0jvcX0YfxqMJfF5oM23C/3
         DHRt6gwlFY6HjEmpApFq8U/J8eXrWyfCychUX33VCCTziK3zni4W2czxgPt14OwcXbQW
         +4mLQnOyTAmNlIES7+FOn1T4Dq1xO4ucdITG07vslx8FskrOmhMJAE3sU4JrMIa1cJR5
         kkbicGAvWkpz+L7I3S8n7BDVajBByp/NPuAwMHBVMoRvY8eaRCSk+cZpZY7afiJhM+Xz
         4DQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=mnlWAzo9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q20si6304346qkl.95.2018.11.05.10.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 10:52:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=mnlWAzo9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:37097 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJjyv-0004Y7-EU
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 13:52:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjyg-0004Vf-EM
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjyc-0000PJ-Ct
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:51:58 -0500
Received: from mail-eopbgr810103.outbound.protection.outlook.com
	([40.107.81.103]:6323
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gJjya-0000MQ-J8; Mon, 05 Nov 2018 13:51:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=STKh8Eqo6HA18AmpdKl/7DJjvk/NyLNwlfv6QlRGaqc=;
	b=mnlWAzo9O50ailJpALVpeVHh+2E7eOVrilZMWd0A0/1Ds+RhoeusvsffpULmYpRuslYKYzz1WtSR9ZyD9fhsWFnEN2O+gay0TylIS7wzNqsSIejI/ZyUs+8b1qc0WMg+CH/eVyx25xWXgmBhbrjFSwunV+YZWYNwo9o3CEBhzAM=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5034.prod.exchangelabs.com (20.176.120.218) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.25; Mon, 5 Nov 2018 18:51:50 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66%3]) with mapi id 15.20.1294.028;
	Mon, 5 Nov 2018 18:51:50 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v7 01/12] migration: Add post_save function to
	VMStateDescription
Thread-Index: AQHUdTic+xF/b3bKKEmBMC9gYr82JQ==
Date: Mon, 5 Nov 2018 18:51:50 +0000
Message-ID: <20181105185046.2802-2-aaron@os.amperecomputing.com>
References: <20181105185046.2802-1-aaron@os.amperecomputing.com>
In-Reply-To: <20181105185046.2802-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR20CA0070.namprd20.prod.outlook.com
	(2603:10b6:404:151::32) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.153]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB5034;
	6:9wjBNs8m887zt7jowrYpNXlcmeEUX4ypMl/FAusFtuvjPj9Fw5KDkpg/ZiaDUdDfXjRYODCZJbRkx5KYwsbX50bKfBi4mgMeu1jrw9rGCKdyCrJwi+ruLB5j9n8vyN20wfSSEmEGDp/GhDfw+1JlqrR5UuhBe8wV3gf27RbMeHEshRlMtXV+3QH/r7GTp8mb1HWrVjukl8eGpZP64Gow0cai8QVvcFSu69FvPBXIRfu+TL0Rw0x0HH1S1UtokSDaNONBz/Ws0oJv8upaB4/egt5twU+AxRe72r8NJ82/jedWsAg73MoKq2iml3sVHUtcgDGC64abZ/IMx6YsxoOy/eFEnSIQH6vrmJP0bquRl4VCioVJqi/ULjyhvXzs4wLkmIxrH/FP+PT4f7qG/oNeiYpSn9XpU6SLg8dWEzS5NY4+HtJaOclMQihbpOlQAghYD8S5ojBUlqVZxmfPF1km3Q==;
	5:2s+d/EbncJoSt4UWfSwn8GJb5J9UgKWK11OGbu3LwQVJXHzTrLmwGK4ncOjHMpMi5fTxB83Acc5OVxE+zHKWjU3JPPWqTJvNlFQ222Faglq5rrvhWKep8IMgX81Uji8j201cL0IKWnjCjiX3ecnxHISIdg2pBk7qyqlyIvNmYEU=;
	7:hMh6JQXxUGQthcuzyqnwm7BhJNbrLS5VoY8AyghjieZ2L1SY/mugWEIpIfyxGV0PPNb62viLPYUJy33hUfDwYd0z/u15KKCQdXTQDZ+dDvX93GiMkQ/HR5HfTlB7nH1cA8ceJCRggrqN294hWUXazQ==
x-ms-office365-filtering-correlation-id: 07e7dcb4-8f5f-4f07-0ac5-08d6434fbee6
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5034; 
x-ms-traffictypediagnostic: DM6PR01MB5034:
x-microsoft-antispam-prvs: <DM6PR01MB5034E96BCCA7976E61969DC18ACA0@DM6PR01MB5034.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:(17755550239193)(85827821059158);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231382)(944501410)(52105095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB5034; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB5034; 
x-forefront-prvs: 08476BC6EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(39840400004)(396003)(376002)(346002)(189003)(199004)(81166006)(52116002)(110136005)(105586002)(76176011)(1076002)(86362001)(8936002)(54906003)(68736007)(8676002)(81156014)(66066001)(102836004)(6512007)(14454004)(2900100001)(2906002)(53936002)(3846002)(6116002)(6506007)(386003)(7416002)(71200400001)(478600001)(14444005)(71190400001)(26005)(5660300001)(316002)(446003)(11346002)(6486002)(256004)(25786009)(106356001)(305945005)(99286004)(7736002)(39060400002)(476003)(2616005)(486006)(6436002)(97736004)(4326008)(2501003)(186003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5034;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: 8BNgOY5iQQpllBzgBViVXw9h3iwxQFd1XURENF8xir6plEMeXscdgP5lh+GKq4aMPyiE9rsF7rljYLoahqSEIAXAdovFnfSnWcjsHIt0GVIOJp62tRvBbLE2znKC5+nO+k39vXXlBVrWtMuR+fpTYUJjLhSduaa24gaCb0fgvJaeQiWzbOO8oP7IrzOUQMikju2TWecbwqh60V1+9w51+Mq/Wq0zKgwqCu2SBQXcCO4w2DOyJO2ouOur/9BYRnLFAoEGUBvbfsU+ZWDrympY6G4/WOMNa2dqbIu6XLXW+9i5bG5+EdS9Gj/g1fpIF+mGUqlkV90/EsZN7AgIrcgj+1OCHwG5CiA1OLSGA2Z8K04=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e7dcb4-8f5f-4f07-0ac5-08d6434fbee6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2018 18:51:50.5579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.81.103
Subject: [Qemu-arm] [PATCH v7 01/12] migration: Add post_save function to
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Aaron Lindsay <aaron@os.amperecomputing.com>,
	Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qQ8PZ2yspvv4

In some cases it may be helpful to modify state before saving it for
migration, and then modify the state back after it has been saved. The
existing pre_save function provides half of this functionality. This
patch adds a post_save function to provide the second half.

Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 docs/devel/migration.rst    |  9 +++++++--
 include/migration/vmstate.h |  1 +
 migration/vmstate.c         | 13 ++++++++++++-
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
index 687570754d..92fb521ad2 100644
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
index 2b501d0466..9355d83056 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -185,6 +185,7 @@ struct VMStateDescription {
     int (*pre_load)(void *opaque);
     int (*post_load)(void *opaque, int version_id);
     int (*pre_save)(void *opaque);
+    int (*post_save)(void *opaque);
     bool (*needed)(void *opaque);
     VMStateField *fields;
     const VMStateDescription **subsections;
diff --git a/migration/vmstate.c b/migration/vmstate.c
index 0bc240a317..c15d75260a 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -387,6 +387,9 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDesc=
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
@@ -412,7 +415,15 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDes=
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

