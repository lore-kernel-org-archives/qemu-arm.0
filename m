Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp216402ejs;
        Mon, 8 Jan 2024 23:02:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFO+ptNflowvVfzQgP3Ee8fypsfmcqHn6xzZJelswHdcnYUurMgcfbuWRuM9wt35MG7rac
X-Received: by 2002:a05:6871:8084:b0:204:350:30be with SMTP id sl4-20020a056871808400b00204035030bemr2429972oab.44.1704783766444;
        Mon, 08 Jan 2024 23:02:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704783766; cv=none;
        d=google.com; s=arc-20160816;
        b=Oi0hSQOWzA11j2Gg+ZLqSr24lKDsz89bmIQYDumaWFhsv0Mhrh8rDwnsK01UPAj1t+
         iVwGpEDLGM4OO648g4YSHQuABWgsP4voUstWj62oZo9z4hrTmYA2kAx9Ex2EMmbDBijS
         +faUbTZDfCe+topRpd0wk9iYLwi/3SR+fr1m/aZ49kwS45s/x9BEKl8uyseyHw9xISXf
         8EBsyQ6MKpjzeVafRiVDZiRWH8O6AivX+I7XRE2xBx1TBzHRARcmdh+T4CDzptt/+wew
         sTnG+L2YJXJFf3EprfTg/dHfRzSzwdjQZbaKQBYBctRnk4XSmFOHRWuf5r6MdUOevoND
         x8nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=fk3lW/H7YArz1mDR5HFFRxmrUo9G3TZZAyplU74Pri4=;
        fh=6rmWHL7R3Sa1wPMi4BMLxGb6bBzBHyF41gU7Nq7sfoU=;
        b=oqfOFwtq2RIPFKwWHo0ZXCYIERWiQfC3Nbn/x45KhV8WUfphu8WHnOr6fb/5RllZO8
         WQkS6Gt7bELsmihHTHc8LN9MuYuvaqW0fYpI18LJypSHDAeBPFIK9U91X6/7E3yB+Vg5
         5yU8vcnJiQ0CIrKCMBoPUiBQTr3LMoKT35tCrkEGR2EEYRU2NEb23IkZ9GNwSAdqJBMK
         k4BNbP/LQh3GwvwHEg6xx2xq6JKT+tN4rBZeU4NydQLb4VuzIOozVsGeL6ECa33MoWjh
         HhM7PlTj0k88Bd7/hZqKxGFvTHSchwUn2Jf7g73HbjBWrBT7KpO6gX5DuthTapyGbR3h
         8zrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fQ598GTI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq13-20020a05620a468d00b00783057f5557si1586075qkb.70.2024.01.08.23.02.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 23:02:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fQ598GTI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rN67s-0007Ch-Ay; Tue, 09 Jan 2024 02:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rN67p-0007C6-LF
 for qemu-arm@nongnu.org; Tue, 09 Jan 2024 02:02:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rN67n-0004IB-9a
 for qemu-arm@nongnu.org; Tue, 09 Jan 2024 02:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704783730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fk3lW/H7YArz1mDR5HFFRxmrUo9G3TZZAyplU74Pri4=;
 b=fQ598GTIkJAAN0B1sUN0OoBLLvIHJ1yJ5kWf0y+e+Wsx3jZxB8nkgAXEf5NRYSWtCmm9Le
 CpL00LVUARh84uj5vFrCNGtcG94vhCC+hd8VtS4t+P6c+pAXdB7tpz7XuVn2pcYiwy9PrK
 9udd2ceAApWYLsNbygLG9GTWXL39nDI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-ZqJd-73BOPq3Pxtdxe2NTw-1; Tue,
 09 Jan 2024 02:02:06 -0500
X-MC-Unique: ZqJd-73BOPq3Pxtdxe2NTw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5719F3814E90;
 Tue,  9 Jan 2024 07:02:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17C00492BF0;
 Tue,  9 Jan 2024 07:02:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 23FC121E6691; Tue,  9 Jan 2024 08:02:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,  "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>,  "clg@redhat.com" <clg@redhat.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,  "ani@anisinha.ca"
 <ani@anisinha.ca>,  "berrange@redhat.com" <berrange@redhat.com>,
 "eduardo@habkost.net" <eduardo@habkost.net>,  "imammedo@redhat.com"
 <imammedo@redhat.com>,  "mst@redhat.com" <mst@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,  "david@redhat.com"
 <david@redhat.com>,  "gshan@redhat.com" <gshan@redhat.com>,
 "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>,  Aniket
 Agashe <aniketa@nvidia.com>,  Neo Jia <cjia@nvidia.com>,  Kirti Wankhede
 <kwankhede@nvidia.com>,  "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>,  Andy Currid <acurrid@nvidia.com>,
 Dheeraj Nigam <dnigam@nvidia.com>,  Uday Dhoke <udhoke@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,  "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v6 1/2] qom: new object to associate device to numa node
In-Reply-To: <SA1PR12MB7199E73CDBB9FA04E188638DB06A2@SA1PR12MB7199.namprd12.prod.outlook.com>
 (Ankit Agrawal's message of "Tue, 9 Jan 2024 04:11:57 +0000")
References: <20231225045603.7654-1-ankita@nvidia.com>
 <20231225045603.7654-2-ankita@nvidia.com>
 <87v884t4b4.fsf@pond.sub.org>
 <SA1PR12MB7199E73CDBB9FA04E188638DB06A2@SA1PR12MB7199.namprd12.prod.outlook.com>
Date: Tue, 09 Jan 2024 08:02:03 +0100
Message-ID: <871qarj8gk.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: nDT00eqj6cOQ

QW5raXQgQWdyYXdhbCA8YW5raXRhQG52aWRpYS5jb20+IHdyaXRlczoNCg0KPj4+ICsjIw0KPj4+
ICsjIEBBY3BpR2VuZXJpY0luaXRpYXRvclByb3BlcnRpZXM6DQo+Pj4gKyMNCj4+PiArIyBQcm9w
ZXJ0aWVzIGZvciBhY3BpLWdlbmVyaWMtaW5pdGlhdG9yIG9iamVjdHMuDQo+Pj4gKyMNCj4+PiAr
IyBAcGNpLWRldjogUENJIGRldmljZSBJRCB0byBiZSBhc3NvY2lhdGVkIHdpdGggdGhlIG5vZGUN
Cj4+PiArIw0KPj4+ICsjIEBob3N0LW5vZGVzOiBudW1hIG5vZGUgbGlzdCBhc3NvY2lhdGVkIHdp
dGggdGhlIFBDSSBkZXZpY2UuDQo+Pg0KPj4gTlVNQQ0KPj4NCj4+IFN1Z2dlc3QgImxpc3Qgb2Yg
TlVNQSBub2RlcyBhc3NvY2lhdGVkIHdpdGggLi4uIg0KPg0KPiBBY2ssIHdpbGwgbWFrZSB0aGUg
Y2hhbmdlLg0KPg0KPj4+IEBAIC05ODEsNiArOTk3LDcgQEANCj4+PsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICdpZCc6ICdzdHInIH0sDQo+Pj7CoMKgwqAgJ2Rpc2NyaW1pbmF0b3InOiAncW9t
LXR5cGUnLA0KPj4+wqDCoMKgICdkYXRhJzogew0KPj4+ICvCoMKgwqDCoMKgICdhY3BpLWdlbmVy
aWMtaW5pdGlhdG9yJzrCoMKgwqDCoCAnQWNwaUdlbmVyaWNJbml0aWF0b3JQcm9wZXJ0aWVzJywN
Cj4+PsKgwqDCoMKgwqDCoMKgICdhdXRoei1saXN0JzrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAnQXV0aFpMaXN0UHJvcGVydGllcycsDQo+Pj7CoMKgwqDCoMKgwqDCoCAnYXV0aHot
bGlzdGZpbGUnOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAnQXV0aFpMaXN0RmlsZVByb3BlcnRp
ZXMnLA0KPj4+wqDCoMKgwqDCoMKgwqAgJ2F1dGh6LXBhbSc6wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAnQXV0aFpQQU1Qcm9wZXJ0aWVzJywNCj4+DQo+PiBJJ20gaG9sZGluZyBt
eSBBY2tlZC1ieSB1bnRpbCB0aGUgaW50ZXJmYWNlIGRlc2lnbiBpc3N1ZXMgcmFpc2VkIGJ5DQo+
PiBKYXNvbiBoYXZlIGJlZW4gcmVzb2x2ZWQuDQo+DQo+IEkgc3VwcG9zZSB5b3UgbWVhbnQgSm9u
YXRoYW4gaGVyZT8NCg0KWWVzLiAgR29pbmcgdG9vIGZhc3QuICBNeSBhcG9sb2dpZXMhDQo=

