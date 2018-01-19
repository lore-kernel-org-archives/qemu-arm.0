Received: by 10.28.71.27 with SMTP id u27csp559164wma;
        Fri, 19 Jan 2018 02:24:44 -0800 (PST)
X-Google-Smtp-Source: ACJfBovMRJGUGaD9v5OKezegm4F+BgZtqS76jaomH7K0zQifbT/L8WqZa+A9Q8ppPNfuc+yDkQ08
X-Received: by 10.129.48.148 with SMTP id w142mr9023006yww.333.1516357483943;
        Fri, 19 Jan 2018 02:24:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516357483; cv=none;
        d=google.com; s=arc-20160816;
        b=klFAtjCIX3v198dptUE45VLPsul2AqYhMg4IZeZYBl6a05jGOSeg7IqidQ5Ep3C+wC
         wQ/T58bkEJu1JOjgSMN3ix7wO5t2zZiB9mu6fTLdZ4eqgrWX0GEkkxZOi1+H7QZKxb30
         nVauXoPt9Ed1zKLTTHOPnQEozJE7shQHBaYUiwIy6iu3Upjd1geRHMesitWCDZ4Nj0S+
         krF2gjx44qnhHzB+vN8Nyg2+jEsyVwWPS5qg2slw/IWFFjuofH2o5Bf1djhVAuuNzBlf
         wRSTe5GURXCx31H5hQS6Pj8anO5CkjWDg3HdDK7q4LQy7MTLt+RqYl6zn7Q4dbs78DjM
         3wyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=iHl+UfzMk+zBHieJnIM0sBdesKkLurQ+sC/u2HIZPig=;
        b=RXmbcoOdFvA/EOwspBdQ9USCcNofUmg8HVSYjEOL3OXoekM8z6OXzadUO2XjTIXF9T
         8mq/TFu70QChSQoUJbwmE4y9gtWEOforNIrv+4bNYoK6HnHvQRy8drTh6zMxrH+17eaF
         dDBKVETDRBm0VD4bprrJ/v92UWU9DAjB2GE4IPjA7h7lBHDtgtr4xP2H8CSJBnVQbnEl
         dOMc1yYww1+VNo6MXs/qbi4Zo9YWU/v62tSN6Fqqgh7kPRflt3NUEJfMYHljHkBq8zea
         VB9SB4BTdd5vMs0TFgnoM9kAOaxsZea4pWfyjkit+TSFTUgnp2OMMWACxorZaV5NFOT4
         +XyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l12si2155474ywe.320.2018.01.19.02.24.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 02:24:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40517 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecTql-00008O-8P
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 05:24:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ecTqY-000078-8c
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 05:24:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ecTqV-0005bl-6g
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 05:24:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38538)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1ecTqV-0005bC-1A; Fri, 19 Jan 2018 05:24:27 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E19B99C78;
	Fri, 19 Jan 2018 10:24:26 +0000 (UTC)
Received: from localhost (unknown [10.43.2.134])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD8FC600C0;
	Fri, 19 Jan 2018 10:24:24 +0000 (UTC)
Date: Fri, 19 Jan 2018 11:24:23 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20180119112423.683a73ef@redhat.com>
In-Reply-To: <20180118203337.GE5292@localhost.localdomain>
References: <1516296842-136976-1-git-send-email-imammedo@redhat.com>
	<1516296842-136976-4-git-send-email-imammedo@redhat.com>
	<20180118203337.GE5292@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 19 Jan 2018 10:24:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 3/5] linux-user: prepare for
 switching to cpu_create() API
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zNIJXkgxrwcq

On Thu, 18 Jan 2018 18:33:37 -0200
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Thu, Jan 18, 2018 at 06:34:00PM +0100, Igor Mammedov wrote:
> > temporarily add #ifdef CPU_RESOLVING_TYPE in linux-user/main.c
> > so that  each target could gradually switch to cpu_create() and
> > not converted yet could continue to use cpu_init().
> > 
> > Once all targets are converted
> >     temporary ifdefs and cpu_init() API
> > will be removed
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  linux-user/main.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/linux-user/main.c b/linux-user/main.c
> > index 450eb3c..d481e8c 100644
> > --- a/linux-user/main.c
> > +++ b/linux-user/main.c
> > @@ -44,6 +44,7 @@ static const char *argv0;
> >  static int gdbstub_port;
> >  static envlist_t *envlist;
> >  static const char *cpu_model;
> > +static const char *cpu_type;
> >  unsigned long mmap_min_addr;
> >  unsigned long guest_base;
> >  int have_guest_base;
> > @@ -3847,7 +3848,7 @@ void init_task_state(TaskState *ts)
> >  CPUArchState *cpu_copy(CPUArchState *env)
> >  {
> >      CPUState *cpu = ENV_GET_CPU(env);
> > -    CPUState *new_cpu = cpu_init(cpu_model);
> > +    CPUState *new_cpu = cpu_create(cpu_type);
> >      CPUArchState *new_env = new_cpu->env_ptr;
> >      CPUBreakpoint *bp;
> >      CPUWatchpoint *wp;
> > @@ -4362,7 +4363,17 @@ int main(int argc, char **argv, char **envp)
> >      tcg_exec_init(0);
> >      /* NOTE: we need to init the CPU at this stage to get
> >         qemu_host_page_size */
> > +
> > +#ifdef CPU_RESOLVING_TYPE
> > +    cpu_type = cpu_parse_cpu_model(CPU_RESOLVING_TYPE, cpu_model);
> > +    if (!cpu_type) {
> > +        exit(1);
> > +    }
> > +    cpu_create(cpu_type);
> > +#else
> >      cpu = cpu_init(cpu_model);
> > +    cpu_type = object_class_get_name(object_get_class(OBJECT(cpu)));  
> 
> Will the final version of this series require the temporary
> #ifdefs?
> 
> I'd prefer to first apply patches adding the CPU_RESOLVING_TYPE
> defines and then patches adding the code without any #ifdef at
> all.
sure, it's possible to do without temporary #ifdef

> > +#endif
> >      env = cpu->env_ptr;
> >      cpu_reset(cpu);
> >  
> > -- 
> > 2.7.4
> >   
> 

