Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1215257ejb;
        Fri, 20 Oct 2023 06:16:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoe2aqRBSk32yLuk20EeDPw3LCPOmzNJN/PfYvSixG/hZo0Kw/SuRPFL3Y66GW1i0/cA0t
X-Received: by 2002:a05:6122:8d4:b0:4a1:a334:57f0 with SMTP id 20-20020a05612208d400b004a1a33457f0mr2023167vkg.3.1697807800940;
        Fri, 20 Oct 2023 06:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697807800; cv=none;
        d=google.com; s=arc-20160816;
        b=ZCcnS9rbXUvWHxUORcwf0X8OMDp+By3DTQxIjEecAtrH+5abWFCSebyHZddDwC8h5a
         7JrWaF4l87bf+cTsekhT2J0QaGhbDuKHefk6HshJ2EqL2WZtyWj1P2/ESNWnbMDN1DYV
         KgG1DGV5BHiNt951wgphfSei4X49tLxnQQDLI6qgEZEKGZfRNknA9uuNdZd2/0Nq+hBM
         +MUp5KSBwP3vgEUd7gZPd+UPHbS0Io57asNSvapQyu7Pmd63hbj1vNv+0lODX4N3t+NF
         XB9hdhVTXqOnQs1Mu0VmwHK9BHYrXHR/tetQ5zUIzRoPjf/q52hRT1kPB9j9J6JtSGqO
         KfJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=9UbcuaBiBteXA87KgI5RwuikkYWwUpYlze4eBavny/M=;
        fh=RaOekM+4h/1Ds3F6w9GkHLjbfROQCG5i1Afn71OceZE=;
        b=bF3DyMdE10CNNC72p6P+rnk8CYrbqcRWTCaFKwnqKkkwvXbNUJjo7MKRmlYw7o/+YB
         3K8rWmIq30drO7DfuhwU5M0VOKQfpHny5CHY3YAVsuN60BGbKI2T1Um9S/U9z7ooxo2a
         sFrcnBeRczisBZeXxeVbcTNdJFWR89BCzwwpXpg8hKVf5wxPbxPZusJ+8EYnPOTWvtcN
         sGBd2Om7MaiAQBXovdDyf9/F3YbQG7NBmFfjaFwxoiDBmhdm6TnnbzfER05G0FPpricB
         bCbMkz8uv+/4AqCQ38BfzUH/OEVeC3pEcGbqzF98oDbhUPx5u975iFX4IvE7O1KR54Pi
         +MDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z5+tkrAl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h203-20020a1f9ed4000000b0048d08ac6f89si160709vke.36.2023.10.20.06.16.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 06:16:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z5+tkrAl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtpMF-0004Rz-5a; Fri, 20 Oct 2023 09:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qtpLy-0004OF-LK
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 09:16:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qtpLp-0000Ma-4D
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 09:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697807739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9UbcuaBiBteXA87KgI5RwuikkYWwUpYlze4eBavny/M=;
 b=Z5+tkrAlqzFtQqEmBvxiw2ad6jTi+JPueKAR2G4Z86W7Za8kmpFfcJdxfwURuj92hJocZG
 eLqyOfo64h1oaoyvs3exsynYy3pCn+wJtX9AgkSNKeqBM07A3yg9J6wNrkcwR6ehTm3Fo3
 9Hy1Opc5yg6tuCqxB73rEHZ03oxbJtA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-HZs4SstHOoiEaGWNtWyebw-1; Fri, 20 Oct 2023 09:15:21 -0400
X-MC-Unique: HZs4SstHOoiEaGWNtWyebw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 055563816B53;
 Fri, 20 Oct 2023 13:15:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D49351121320;
 Fri, 20 Oct 2023 13:15:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D577A21E6A1F; Fri, 20 Oct 2023 15:15:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,  qemu-s390x@nongnu.org
Subject: Re: [PATCH v2 00/22] qapi: Kill 'qapi/qmp/qerror.h' for good
References: <20231005045041.52649-1-philmd@linaro.org>
Date: Fri, 20 Oct 2023 15:15:19 +0200
In-Reply-To: <20231005045041.52649-1-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 5 Oct 2023 06:50:17
 +0200")
Message-ID: <87lebxzb88.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: iNVyxMPVlJYR

Your patches are sane, the problem is they made me look at the code they
patch, much of which is not fine.  Let's chat off list to figure out how
to best get your patches merged.

