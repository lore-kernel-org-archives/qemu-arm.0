Received: by 10.80.166.35 with SMTP id d32csp790278edc;
        Tue, 1 Nov 2016 11:13:51 -0700 (PDT)
X-Received: by 10.99.113.90 with SMTP id b26mr23094687pgn.33.1478024031498;
        Tue, 01 Nov 2016 11:13:51 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id n11si31691858pgd.282.2016.11.01.11.13.50;
        Tue, 01 Nov 2016 11:13:51 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753569AbcKASNt (ORCPT <rfc822;xinliang.liu@linaro.org>
        + 7 others); Tue, 1 Nov 2016 14:13:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:36157 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751317AbcKASNs (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 1 Nov 2016 14:13:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 84EF4ACF3;
        Tue,  1 Nov 2016 18:13:46 +0000 (UTC)
Subject: Re: [RFC 1/2] linux-headers: update
To:     Peter Maydell <peter.maydell@linaro.org>
References: <1477775449-115472-1-git-send-email-agraf@suse.de>
 <CAFEAcA96Cqfk4QEok-nEV28wnv6BJavgc9XWJVTWmJxi2RbrCw@mail.gmail.com>
Cc:     QEMU Developers <qemu-devel@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
        "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>
From:   Alexander Graf <agraf@suse.de>
Message-ID: <343970da-014f-2edd-d865-e20293e32f78@suse.de>
Date:   Tue, 1 Nov 2016 19:13:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
 Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA96Cqfk4QEok-nEV28wnv6BJavgc9XWJVTWmJxi2RbrCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: zQrXlpE/AYUZ



On 01/11/2016 11:19, Peter Maydell wrote:
> On 29 October 2016 at 22:10, Alexander Graf <agraf@suse.de> wrote:
>> This patch updates the Linux headers to include the in-progress user
>> space ARM timer patches. It is explicitly RFC, as the patches are not
>> merged yet.
>> ---
>
> Is there a cover letter email for this series ?

I figured that the set is so small that it didn't deserve one :).


Alex
