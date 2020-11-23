Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3610220lfb;
        Mon, 23 Nov 2020 05:53:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyv6iObh6m/ddkV465HbDZC3wgfXt7ae7t1gC9WdjYHRwrLqRtXfpMk7U1TY3VkvRhaS/i9
X-Received: by 2002:a25:59c3:: with SMTP id n186mr44406123ybb.411.1606139603778;
        Mon, 23 Nov 2020 05:53:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606139603; cv=none;
        d=google.com; s=arc-20160816;
        b=IWRtwERdzAeMKCk1XctsZ6go6OCKK6VNrrJ61v+M96L41I7wBRY0hcbE3bkXxM9BiQ
         IVQ6220P+3+9dusCU6ekokJraohrgkOm1scVseeC8tC8COR5Yhjj1hacDUoH82DKtbZK
         fLghMXA+o3fX4tMZOv37w5BtExV7M7yQNOTIFCpSf71kJCO2YY/p/RDgS+4SnB6BMYhi
         AhmAVtxmWixz8/YWbJccqGLEcMWLvYQiVyrn/bRwxVJHOOWX5aXqiJydvOBGCLXyFjly
         FixMmRKuz1cJL0iTiHz3IC7RJb/A27Xck/HJaSxY4MjCDtf9gEfbDv8VdJh2Nlp1pZQE
         WkOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=ooSF46QhlsVPumbusjyn5TcKvp7fanANg2KfWEMgU14=;
        b=KyItvRl+2pgQ9/goSssPvTLmisRisuIEfCd/JTu/K9zb7K8SHchkXa+TX9WK9lvMsv
         Lanau5CIXY0MVz3LhL+rrz/B97uCNWSmhIFM9AKrkz7JsE4CUdfCOO6D3TBYYur6JdWO
         rhtE8bVuAUuFwCXe6Uga7VTyaFFAMrIdwbFV5TTbxTt6TBCM7ZodNy+vmJbb6YFkPseM
         F56Ypy6dQvUq2j2g0bLCT8+q4NBjrfxxVkWGTPyJBsax1XOql+V7dcl+XXIC545VvOSp
         mlsKN/gZpicMqyKwFjHdhhNBI1vEchfC+AlTzx0OP/nF2iF6emBg7Q52L7Hhm/wDnK7E
         LDtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OSSnD0DV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 83si10553237ybn.263.2020.11.23.05.53.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 05:53:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OSSnD0DV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khCHT-0003zr-5E
	for alex.bennee@linaro.org; Mon, 23 Nov 2020 08:53:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1khCHG-0003xt-59
 for qemu-arm@nongnu.org; Mon, 23 Nov 2020 08:53:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1khCHD-0008QH-6t
 for qemu-arm@nongnu.org; Mon, 23 Nov 2020 08:53:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606139585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ooSF46QhlsVPumbusjyn5TcKvp7fanANg2KfWEMgU14=;
 b=OSSnD0DVYtM2/rWAD8aul5E5tYYf/16BEug5D74QU2XI4nq1Hk0zO6W1bFh92FBW2s3vjv
 cAp5qdVWlbl/FvkQKssoL68GXnBtFsTZ06UVM1QlaiccAmnx+gTJfQ4j9iGEgtFnaIRXTo
 jNHJrSsXyMrjh1fo0XAnvgOBlsIUblg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-SziwhRnYO4uETZ0qcrZFHg-1; Mon, 23 Nov 2020 08:53:00 -0500
X-MC-Unique: SziwhRnYO4uETZ0qcrZFHg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C193884635C;
 Mon, 23 Nov 2020 13:52:45 +0000 (UTC)
Received: from gondolin (ovpn-113-104.ams2.redhat.com [10.36.113.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B80A5D9E2;
 Mon, 23 Nov 2020 13:52:37 +0000 (UTC)
Date: Mon, 23 Nov 2020 14:52:34 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH RFC] vfio: Move the saving of the config space to the
 right place in VFIO migration
Message-ID: <20201123145234.266a7e42.cohuck@redhat.com>
In-Reply-To: <20201120150146.5e5693e9@w520.home>
References: <20201114091731.157-1-lushenming@huawei.com>
 <860bd707-8862-2584-6e12-67c86f092dba@nvidia.com>
 <20201119104127.5e243efa@w520.home>
 <a7be9306-f800-0323-293e-217e2e9f6015@huawei.com>
 <20201120150146.5e5693e9@w520.home>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Neo Jia <cjia@nvidia.com>, Eric Auger <eric.auger@redhat.com>,
 Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org, dgilbert@redhat.com,
 Shenming Lu <lushenming@huawei.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-arm@nongnu.org, yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5VHt3wZU7HzJ

On Fri, 20 Nov 2020 15:01:46 -0700
Alex Williamson <alex.williamson@redhat.com> wrote:

> Given our timing relative to QEMU 5.2, the only path I feel comfortable
> with is to move forward with downgrading vfio migration support to be
> enabled via an experimental option.  Objections?  Thanks,
> 
> Alex

Agreed from my side. It seems better to give it one more release to
figure out some issues, and just mark it experimental for now.

