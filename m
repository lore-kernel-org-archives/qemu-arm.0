Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3928125lfy;
        Tue, 18 Aug 2020 08:29:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxU58YpEKH56vJFykGzImhd/QWVP23hGgWf4WJndPW7EwnnA14VQVrIt/F4sPGzMY42tHRq
X-Received: by 2002:a25:500b:: with SMTP id e11mr30650976ybb.261.1597764551302;
        Tue, 18 Aug 2020 08:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597764551; cv=none;
        d=google.com; s=arc-20160816;
        b=eiLMdboX/tTNdV6vqGNFEK+T7K6kVvN7soIv/agPgHOvfZwxsIgF7eblHYP5tvFZu2
         tbLCDQGNpHVOR710Pbx0FznZ7z6/3XLiYiaxCbquk0gNHATZF01ze1JtNeSZiVIerkZD
         rMsdfHs/MNZeWMwErVXEnGMsFUkEOBvwStWCkXkS582/OYX1IU9etgTfQyjqa4EDZ4Xn
         wm62SSGlTj5K1I+bscixhUBbeURRFw9VdDZAPtVNMt3tYYqUf/p8LI1M4uY4F7whplpG
         XNmrGnny8JVNJtUzXoTBn2bcmw5rKDys1GshcF53ISJjX/w2VkFSOqJYhN9qCjS3qcc9
         OEzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kaTbMGanT71s89DsJoOZGDCpWg1RR6kbH+cjUVEgFgU=;
        b=KJscyZd+WF713X/X/+YPoDzXSvanrflOjJRkFPrWjqeVhOAyclpCkNId9BK2an+RUS
         Rl7q4USlZovRpybuFbFeLn6uuy6Adth/2Gi21ab4b39a+QhHLciheHZbKKtNtqxzRevu
         qtoxHW6E883w2tsOFl7+kksapb3bP8/alz/bvE7JcOAj7UUqDpAQWDxwPKCSUc9pD07U
         nEsg1RBM+JfaZhEpZmDmPOs0rljTMZztwjabZTNIR0zxLW12iIcAjW9673frwA9qmSHU
         /8hpXaVNzhy21YXR05sW786jRR2Xc86g1GCJya9o0uY8NsPYmb7s7E+k2w+iQGtuW6rl
         bI2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bUCeU7Yk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17si21132300ybq.44.2020.08.18.08.29.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Aug 2020 08:29:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bUCeU7Yk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k83Xy-00056p-NJ
	for alex.bennee@linaro.org; Tue, 18 Aug 2020 11:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k82gz-0004rF-RY
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:34:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k82gv-0002Sc-TY
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597761261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kaTbMGanT71s89DsJoOZGDCpWg1RR6kbH+cjUVEgFgU=;
 b=bUCeU7YkZa9wDlAREaE7ZbGKkuilNzs0cdU6KodMvRZpOveHD8c4hRXww3ZtxD8MjEqgIx
 uxzF06mqCYM02XKl5RUIvsZ/5MSeWFt/3zFrZLZFjhX4AV5qfFFi0k6zgR7h4+Zm/oZGaX
 XYkVr1hsoTIek94oL9XE4Mbln/n7GMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-TZ6N2GSJOE2UYmnKRps_6g-1; Tue, 18 Aug 2020 10:34:16 -0400
X-MC-Unique: TZ6N2GSJOE2UYmnKRps_6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA11A8B8D22;
 Tue, 18 Aug 2020 14:34:04 +0000 (UTC)
Received: from localhost (ovpn-114-160.ams2.redhat.com [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E07C16B8E0;
 Tue, 18 Aug 2020 14:34:03 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/7] Open 5.2 development tree
Date: Tue, 18 Aug 2020 15:33:42 +0100
Message-Id: <20200818143348.310613-2-stefanha@redhat.com>
In-Reply-To: <20200818143348.310613-1-stefanha@redhat.com>
References: <20200818143348.310613-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 03:22:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, cohuck@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p5VchxNzqAJY

RnJvbTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPgoKU2lnbmVkLW9m
Zi1ieTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPgotLS0KIFZFUlNJ
T04gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9WRVJTSU9OIGIvVkVSU0lPTgppbmRleCA4MzE0NDZjYmQyLi43ZDQwY2I5
ZDM2IDEwMDY0NAotLS0gYS9WRVJTSU9OCisrKyBiL1ZFUlNJT04KQEAgLTEgKzEgQEAKLTUuMS4w
Cis1LjEuNTAKLS0gCjIuMjYuMgoK

