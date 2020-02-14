Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1856864lfp;
        Fri, 14 Feb 2020 04:38:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqycya6228wcJo3/WpxoRCuHHLFkgwqNmlab0K9bjqQC6qCLWLgrmPY6mmAUihQpgBDJOZZt
X-Received: by 2002:a37:8343:: with SMTP id f64mr2191899qkd.21.1581683901720;
        Fri, 14 Feb 2020 04:38:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581683901; cv=none;
        d=google.com; s=arc-20160816;
        b=e+Viguunr7yXhN3D64WXVl18oivHseEaRkjpuwN2gINRAZaHICU3gR9Du77MJJr9Sg
         JY5lv5kBF1elZTtQO+nmA4pejZ7Zio1j4UpzB33DKEGWfz0vxskT7/SlJq+5foO7loVf
         CWAwfFA9QEO5D2d+ISOtPomLtjugYjqY+MyC/3+55XEBpFvCVemEoABa4LVLBDABV48q
         FKRhgGG5yDOQ8/KYMxT45QMynG10M4nnVmVCoFmLcasOFhdyOUkT0VYidFsnFH8fGYiJ
         RjG3QyUxAaXrQxWrsqy97BlxjNKMKbclxYUuewTQa0mXHy7Jmkl2CXuLHXtTQ2BM3sCQ
         ZJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=+W9txIdLoOWr6vncr5tz07ls1P8lsw8pGo5wlUeuoNA=;
        b=XuvKrXy06bSthyBzf1Fet5wYxhQnmjWYhVmHBgqf2AbZWv0GjnzJAhAPVdJFrgee2+
         v7SnB5O6FDo5s0A0z5N5XGkJmGmXe4SJ8RsD9VeY3ulfUQ5xFdQbaEXPJ/n0sBfAPwoU
         eRhOzVsDAj9xe5OjdEAXGyjTJpnAFDttgaTHjCNNHcQ0knc9dfqg+LhK/cjKWVgNLwsw
         CNrbGSkdfwRhQ+Jb+sSS4+bEVCkCCGZ2C6yejMvvSDYRWz9rkIR1NV86ZCRtDeZ6GNmB
         NcQPjaSkka8ksuTvqw42GGovAyWZzXIGqp/8Ls5Kcxqqbqt69iADxxz2FaKv7LcijEMq
         3xAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="V/VJkl0b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay1si2434421qvb.174.2020.02.14.04.38.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 04:38:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="V/VJkl0b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2aEf-0004MQ-7H
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 07:38:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38862)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j2aEO-0004K7-DZ
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 07:38:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j2aEN-0001bJ-H2
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 07:38:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24968
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j2aEN-0001ac-DY
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 07:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581683883;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+W9txIdLoOWr6vncr5tz07ls1P8lsw8pGo5wlUeuoNA=;
 b=V/VJkl0bbhNW8lNSjlZgEmofiMcGNSgBMJWEnydVdaBm1faExuFd6rfZ5kE3JJe1bmZW5K
 6flJBv1HSndW0Eyc0jKfj5EGZwa51cxNoyL/7DWqwDP9r0oRCdEAzolC7UiFZe4586XHNu
 diIBFFdOtRout7U4Y2MghEgGWdL+6DA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-fx-gXt9PNJ6KGX-SnriOww-1; Fri, 14 Feb 2020 07:37:59 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E72D38010E9;
 Fri, 14 Feb 2020 12:37:57 +0000 (UTC)
Received: from redhat.com (ovpn-116-40.ams2.redhat.com [10.36.116.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C4D6863D2;
 Fri, 14 Feb 2020 12:37:57 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH] migration/throttle: Make throttle slower at tail stage
In-Reply-To: <20200214032700.25011-1-zhukeqian1@huawei.com> (Keqian Zhu's
 message of "Fri, 14 Feb 2020 11:27:00 +0800")
References: <20200214032700.25011-1-zhukeqian1@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Fri, 14 Feb 2020 13:37:53 +0100
Message-ID: <87o8u1gx9a.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: fx-gXt9PNJ6KGX-SnriOww-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, wanghaibin.wang@huawei.com,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yCrbGdK8mEzg

Keqian Zhu <zhukeqian1@huawei.com> wrote:
> At the tail stage of throttle, VM is very sensitive to
> CPU percentage. We just throttle 30% of remaining CPU
> when throttle is more than 80 percentage.

Why?

If we really think that this is better that current approarch, just do
this _always_.  And throothre 30% of remaining CPU.  So we go:

30%
30% + 0.3(70%)
...

Or anything else.

My experience is:
- you really need to go to very high throothle to make migration happens
  (more than 70% or so usually).
- The way that we throotle is not completely exact.

> This doesn't conflict with cpu_throttle_increment.
>
> This may make migration time longer, and is disabled
> by default.


What do you think?
I think that it is better to change method and improve documentation
that yet adding another parameter.

Later, Juan.

