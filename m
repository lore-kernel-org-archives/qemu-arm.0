Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1644887lfb;
        Wed, 2 Dec 2020 16:41:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeqRViym8fGUzWyqgk6EmFjd1zxy2mQl0JL+b36xyJ5EYY6wX/w5mH9J/E7HjmGAjpkAlB
X-Received: by 2002:a25:41c7:: with SMTP id o190mr1138335yba.324.1606956117125;
        Wed, 02 Dec 2020 16:41:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606956117; cv=none;
        d=google.com; s=arc-20160816;
        b=DOe/lwM24cOKHywbnmj80U5/SuVSgs0SIZURRvzFL7vB5xiycmA6gNjABNenr0zbcv
         X7RUCY31Sjrmj6gZBc9FLAsHw0VsdiDqXfHlc8O5EKBEMdfXZsj7pJtQZZ+uNz2Vs+mP
         lpPYOEPbE8UfF57tGhLVmsL5EgiSSIExos7fM2vxAmaqD/gztmDY/zxYqxcvLDkJDqyO
         a1bbczf4RcuLSow08jdngp/rzVHAo8K+XqF5ZmQ5Wfc6OpBwYC71tC2LJTxNwefcDUUm
         ZL6OVOryvdoZgW50k8BknMGdvsO0KHpEhkLBrGfFWaJUstsw23R+gtiN988TCP2VI6De
         waNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Uk+L9DsChPJiVL25OuwJ6siRnBpBs1wpnH+xUmRy2Xw=;
        b=Gb9+3P+pbiEKPO06y/ExmCbot9+KytkIzPDc+YidTSA5HECgpYJ5p9itZlJQ+EW14P
         uzoNKOlcERU7i27cZDpI66Wf9MBRYyR6ZkzByO0BboRQ/dRm6eHc8I4HpvOOWAhG2GPV
         HWVpQVtHxj3I/E4sSBMyj9feD7QelEBDVTCiS7hLKjapf3r06m6wCiRaoQmDvpyxcrG4
         apQlnyz1vH9qCX6acSifYKDpFaN3lGEYeW2JqXUrWx5PRxwpDQVS6SK+S7IOP+rjSTJG
         5mmiiOg0udeHb3fqfoNObqn1BOwZ7WT2yz6fnQvvAWdDubVfkq1ZY2HoRad9v9NNsEgt
         g5tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=F4obksI2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f197si194864ybg.149.2020.12.02.16.41.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Dec 2020 16:41:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=F4obksI2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost ([::1]:49594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkch2-0000X1-HA
	for alex.bennee@linaro.org; Wed, 02 Dec 2020 19:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkcgq-0000WP-Mc; Wed, 02 Dec 2020 19:41:44 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:35298 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkcgn-0006tx-DR; Wed, 02 Dec 2020 19:41:44 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id D0CD94137A;
 Thu,  3 Dec 2020 00:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1606956097;
 x=1608770498; bh=URO/v4zBFuJEc4EyxyOUNrVOlRQJcC1Wixq1GiQHcZQ=; b=
 F4obksI2nBeqxwo7RqzmL7yVIG5sNYPbCxkUOIsq+gxECh61agHUxnwG4hlk11+l
 KTD98Kh8Ku/D0uTw/xSDiaOVkY4eHLl4CrqIk9Pz9owU2WXkXXTGbZQSqINeOdaY
 17oo82G7xq9umFn+EEFWnqztiHi8hySBLksmeM3lOoc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1RBxTEHYtFzF; Thu,  3 Dec 2020 03:41:37 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 47E2441377;
 Thu,  3 Dec 2020 03:41:36 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 3 Dec
 2020 03:41:36 +0300
Date: Thu, 3 Dec 2020 03:41:55 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v3 03/10] hvf: Introduce hvf vcpu struct
Message-ID: <20201203004155.GA75161@SPB-NB-133.local>
References: <20201202190408.2041-1-agraf@csgraf.de>
 <20201202190408.2041-4-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201202190408.2041-4-agraf@csgraf.de>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tx/ObgXhaz4B

On Wed, Dec 02, 2020 at 08:04:01PM +0100, Alexander Graf wrote:
> We will need more than a single field for hvf going forward. To keep
> the global vcpu struct uncluttered, let's allocate a special hvf vcpu
> struct, similar to how hax does it.
> 

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>

Thanks,
Roman
