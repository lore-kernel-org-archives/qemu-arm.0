Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1136737lfg;
        Fri, 12 Mar 2021 03:28:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYwhjW7+OZY9EysUQbVxEeesVzC8DT7RAs12kGNc6Ik8jDkzPUcSz0T7RtrTjJQRc2/0AB
X-Received: by 2002:a6b:ee0b:: with SMTP id i11mr4055284ioh.157.1615548532339;
        Fri, 12 Mar 2021 03:28:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615548532; cv=none;
        d=google.com; s=arc-20160816;
        b=L/7R8a6fLhaWlla3wI81nUHWQSdz36E2RbP5YAZnn/1gvK3lt3NGTt1dH6V/prsnqS
         dcEdQ6OmfODsOYHoiSI2kKn2nWNb11bMKtcPIhsaSWdm9282HbNM8e6Xmrqr/AXBSXg8
         3LVFOYc8rmp8XpbVAn5jxbauGO9Q82R7ZX8mgz6UjRLfrr61G6m1F7oxq+WN3jHMakT2
         dQp/Ezf92Gu4smKx3804B8eJvw6suuw7891m815M+AhJrN+zuQdzaSiKqi6dZdEvXbFP
         Dlbppshu6tQeH3Zt1U7cmoecvFs36c7/6n3jIwLiaxKGSVPZ0kuWPNmEmDyPWa/P+ccv
         WPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=k5lMaXbu+qG8FxHXTd2WKCa5R2v9w1aouwf52jyQZx4=;
        b=SYhfGYyFHBrwgGVYLs0Cof5Ti2vMNKXRG6splCDEuOX2N3/py7TZe1wpv3HtcQA88n
         Gh9ztYfqvsYUpSJyKZAgc23H28uoinT24/WZCR7sZ0JozhJxxsjxw8bIj+0Mh069F3UT
         dbnTl80N4zidKWzAlXt064AfWBkzKEUtQmr+SXKv+fdnZfUfXtO5yNlamr7H3gCbYMwv
         qyqvnMVC04K8zpzCIAk+xpq25bjSKqyLgutrHd/+ZGLCl5CmEVQtiBAPu7GrAk5HWF+/
         PfObQqPLqJF0ldlrnNWu63XHhfSkYsatHNA5RCXuSHkuqeEIa2kKMHeCgwp+OgflBMNi
         PKmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aYA+vTt7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10si2133485ilh.37.2021.03.12.03.28.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Mar 2021 03:28:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aYA+vTt7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKfyN-0005Mq-LE
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 06:28:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKfxk-0005Lp-3x
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:28:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKfxi-0006ka-My
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615548490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k5lMaXbu+qG8FxHXTd2WKCa5R2v9w1aouwf52jyQZx4=;
 b=aYA+vTt7JUwD8HZ1LG63BBzGKjG5OnjwnB5GX7ICk2/wMpsZX04C/J34+/5oSt+qP2xJHq
 Q9k6wGOv3l17P+XJTOOxu+5r+tz7dkx9QHsK1iwWm8a3anmWB3WONqWwXveSbOjuNm+kqT
 uWB/CiPubFAAHKaz2BSV1XB+jkJ4WxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-1l4_OJRsOxmn2LuAAaM4vw-1; Fri, 12 Mar 2021 06:28:06 -0500
X-MC-Unique: 1l4_OJRsOxmn2LuAAaM4vw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4F4A800D55;
 Fri, 12 Mar 2021 11:28:04 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A720310016FC;
 Fri, 12 Mar 2021 11:28:02 +0000 (UTC)
Subject: Re: [PATCH v3 3/3] tests/qtest: Add test for Aspeed HACE
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Laurent Vivier <lvivier@redhat.com>
References: <20210312105711.551423-1-joel@jms.id.au>
 <20210312105711.551423-4-joel@jms.id.au>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <954fff32-bedc-ec29-1d71-fe37cbcd093c@redhat.com>
Date: Fri, 12 Mar 2021 12:28:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312105711.551423-4-joel@jms.id.au>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0kOlxcvFQAqP

On 12/03/2021 11.57, Joel Stanley wrote:
> This adds a test for the Aspeed Hash and Crypto (HACE) engine. It tests
> the currently implemented behavior of the hash functionality.
> 
> The tests are similar, but are cut/pasted instead of broken out into a
> common function so the assert machinery produces useful output when a
> test fails.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v3: Write test without libqtest-single.h

Thanks!

Acked-by: Thomas Huth <thuth@redhat.com>

