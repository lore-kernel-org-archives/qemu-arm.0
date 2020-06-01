Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2877056lfc;
        Mon, 1 Jun 2020 01:07:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJ4ZhhaxiH/BudVnNav+TKDIn1kYrIywp9snjqsRO+V0FR8tMi9zQf/+0kGH5biKzSWnm3
X-Received: by 2002:a25:b909:: with SMTP id x9mr31589722ybj.163.1590998861343;
        Mon, 01 Jun 2020 01:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590998861; cv=none;
        d=google.com; s=arc-20160816;
        b=dxH6NALhR8Np7dNfWhUVBWzcIPCwQMOBgvOhwZ+30JHmlt/D5G+vjKs9c4/Nf4UBgB
         FPG1IcMtgc7c7uEbGj+dnbESw/umbdS7VFM9Kv58H9RV79A+Sr6GLBZjFh7mg9f+sQsY
         RgY6zKHzP5Nr99HNzeHwwfO0y9r2SqQjmwOWMyZcYEyfPUzjDWXCuMLv5XPVdlRgkaCb
         XR7hcr+oD06p8+gi2Il9lTMCGenB9klmHRjkhr05B9SxEI49PmDebQf+d3m6ocupdTkc
         yATG/g+eRpmDUyQh1oOFih1B5i1OruV5hkoh3jXwluF8XsC74Ob0XPMh3Z01tIOd+ycD
         F+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Cqn/+oCqCDOsPXDEw+nqqcFn1owjVnj7bHKeyOuO38U=;
        b=w5Gf7Y6G2FTiHEIh9XGPe22H8uNZGKOl72hT/ASLJKbKQd6N7aveeZqaIlCwa4b94q
         GdlF43H4Krh9wy6JuaAyOtgyt1FlWoeoNKzgDzoWluVdH5jUTUJH2niUiBMy5cVqiY6v
         vMUTorJB9OhcJsP4Ol00ciezoqA5G1jWFshKIp8uihKY9IUFMy+tm+BqENawOrI+6LAj
         sge/e+5yLyCWSgIREIc3dGHgOcVKtbQwZUjz84zls6LlfTNRMZBfaeLtqNByPLqVPrZq
         Okc3NLydSjmyFoWjB+EEIWTjPpw5Rb7lN506YrZMA5FxSOXWA7KvkGqckK8pD59PjLCG
         ukQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A47rq8Y4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f133si5438808ybg.293.2020.06.01.01.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 01:07:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A47rq8Y4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jffTw-0001p8-Oj
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 04:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jffTq-0001ox-6H
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 04:07:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23306
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jffTp-0006O0-BP
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 04:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590998852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cqn/+oCqCDOsPXDEw+nqqcFn1owjVnj7bHKeyOuO38U=;
 b=A47rq8Y4mIiTR3SHAbRa396fc6C6vL9m/UWI42ejo7jc9IiaLlRjXrQvbMfz5UJgrYL3z+
 WJM+oSMrHHk2qKM0dGm51hVU228dSq71xX2dAJEt8J24ZaPLKkmbBgHQ00GNhMEF+00Hsm
 Hl6McLNnP56YwS3D1dXGWGyPs/nl0G8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-THQpFcpbNg25J_-cSO8iZA-1; Mon, 01 Jun 2020 04:07:29 -0400
X-MC-Unique: THQpFcpbNg25J_-cSO8iZA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F36D8108BD15;
 Mon,  1 Jun 2020 08:07:27 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BF7E5C1BB;
 Mon,  1 Jun 2020 08:07:23 +0000 (UTC)
Date: Mon, 1 Jun 2020 10:07:18 +0200
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: About the kvm-no-adjvtime CPU property
Message-ID: <20200601080718.jul5r4qebpeieyfl@kamzik.brq.redhat.com>
References: <b4389848-10fd-a906-9901-d1d354ce4842@huawei.com>
MIME-Version: 1.0
In-Reply-To: <b4389848-10fd-a906-9901-d1d354ce4842@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 02:19:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wu.wubin@huawei.com,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GfshjKGNAZ/u

On Sat, May 30, 2020 at 04:56:26PM +0800, Ying Fang wrote:
> About the kvm-no-adjvtime CPU property
> 
> Hi Andrew,
> To adjust virutal time, a new kvm cpu property kvm-no-adjvtime
> was introduced to 5.0 virt machine types. However the cpu
> property was enabled only for host-passthrough and max cpu model.
> As for other cpu model like cortex-a57, cortex-a53, cortex-a72,
> this kvm-adjvtime is not enabled by default, which means the
> virutal time can not be adjust for them.
> 
> Here, for example, if VM is configured with kvm enabled:
> 
>   <cpu mode='custom' match='exact' check='partial'>
>     <model fallback='allow'>cortex-a72</model>
>     <topology sockets='2' dies='1' cores='2' threads='1'/>
>     <numa>
>       <cell id='0' cpus='0-1' memory='16777216' unit='KiB'/>
>       <cell id='1' cpus='2-3' memory='16777216' unit='KiB'/>
>     </numa>
>   </cpu>
> 
> We cannot adjust virtual time even if 5.0 virt machine is used.
> So i'd like to add it to other cpu model, do you have any
> suggestions here ?
> 
>

Hi Fang,

The cpu feature only requires kvm.  If a cpu model may be used with kvm,
then the feature can be allowed to be used with the model.  What I find
interesting is that the cpu model is being used with kvm instead of 'host'
or 'max'.  Can you explain the reasons for that?  Currently, when using
kvm, the guest will always effectively get 'host' anyway, even when a
model is provided. Indeed, for a model to work, kvm requires it to exactly
match the host cpu and even then the ID registers are passed through from
the host CPU, not taken from QEMU's model.

Thanks,
drew

