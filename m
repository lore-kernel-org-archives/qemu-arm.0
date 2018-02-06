Received: by 10.28.71.27 with SMTP id u27csp4326186wma;
        Tue, 6 Feb 2018 14:18:27 -0800 (PST)
X-Google-Smtp-Source: AH8x227+K3ztC+Lhis/kVRbE0ENG+AwQ7dGgla79AK6hCevGYoiWvbCRpbQTq3uN9FzInC8+83D/
X-Received: by 10.129.166.6 with SMTP id d6mr2528568ywh.97.1517955507213;
        Tue, 06 Feb 2018 14:18:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517955507; cv=none;
        d=google.com; s=arc-20160816;
        b=U66VoSUKPuG9WoWn0neMySePAd+tcp5krCdWEmPDHRBq+GLF62sY0WnO7+fBZQi4Yd
         AFBc0uy0QCx0vxZ9CWGLDGhOwmOBrBco8f7GQFer/clhJUYMJk+2Im57eCh/hRaCrA/G
         hKVqRnphcrYtI6/vPAdAxKoyyhDouZmTp++HA+09DuZfHbHpazIbNJVhRh50ItLEUMyM
         TlTGg+HR9uZfOHcq47r5iPFEmg6ybl6kJ6Z5RdeCi+muNrNd9jb1oF349HuCK8h42F+D
         BSx8XBQRTFqVjcbPmT7DavnEGI6OCRvWUr8VHgqy9ynM1o7lkX2PUlL710wZ9hstgTHQ
         Ej3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=AyfIOk6VcxrDqkqPNciidOne4uVZ2OUSVty9wZsYIyU=;
        b=AUxodWHTFZtQgn30MGWgxhSQsdn3GCFK6XG+Mt5u8VKJcCKcIXgphZAxGh+2GZts4l
         Uje6b1ZYK/jcGbKT9hOftIjaAFo+8eYcuOyT3wjDAqxvBHc9aqAzt17Rmq7twiEruVzB
         2H6K3Ys7iMMz40exFJLN3/F6TZXDpEbfZOZ3/+jr3+IQtadLU/bwspywjOA+LlClt+IM
         C4mu2BxU5zmfhKCA/XyGm5JodiXMBn+W6xmrVdniAbXOEcY9LVv/nVyIiJz0s9FkiEk1
         n5MUPERHcrFE425IO/ggL93MyIXRsmB2bOwqRHQ31D4vnHZYXzgizdvNSnLG46wv/8f2
         DXcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y82si3436ywc.444.2018.02.06.14.18.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 14:18:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejBZK-0007h2-L9
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 17:18:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ejBZ7-0007fK-EG
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 17:18:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ejBZ2-0006aL-9z
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 17:18:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42828)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ejBZ2-0006Yn-3I; Tue, 06 Feb 2018 17:18:08 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46838C0587D1;
	Tue,  6 Feb 2018 22:18:07 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D110D5EDEA;
	Tue,  6 Feb 2018 22:18:06 +0000 (UTC)
Date: Tue, 6 Feb 2018 20:18:05 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20180206221805.GC13301@localhost.localdomain>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
	<1516694904-64879-4-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1516694904-64879-4-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 06 Feb 2018 22:18:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 03/25] arm: cpu: add
 CPU_RESOLVING_TYPE macro
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a9e0XYpHTV/+

On Tue, Jan 23, 2018 at 09:08:02AM +0100, Igor Mammedov wrote:
> it will be used for providing to cpu name resolving class for
> parsing cpu model for system and user emulation code.
> 
> Along with change add target to null-machine test, so
> that when switch to CPU_RESOLVING_TYPE happens,
> thest would ensure that null-mchine usecase still works.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
[...]
> @@ -4325,8 +4325,6 @@ int main(int argc, char **argv, char **envp)
>  #else
>          cpu_model = "qemu32";
>  #endif
> -#elif defined(TARGET_ARM)
> -        cpu_model = "any";

I don't see any explanation for this hunk in the commit message.


>  #elif defined(TARGET_UNICORE32)
>          cpu_model = "any";
>  #elif defined(TARGET_M68K)
[...]

-- 
Eduardo
