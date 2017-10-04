Received: by 10.223.197.9 with SMTP id q9csp5375128wrf;
        Wed, 4 Oct 2017 00:41:39 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAsz03kg1ygFpWYmEel617Y1uwYSzdq8FXL97wsQ+lV+lxsaYyf/ItgTtljcj5YaU5r63r7
X-Received: by 10.55.33.71 with SMTP id h68mr24517176qkh.109.1507102898931;
        Wed, 04 Oct 2017 00:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507102898; cv=none;
        d=google.com; s=arc-20160816;
        b=czxvHSqbLPKZv3Hc2bSTq7PGFleiEKdsJgMernij3FobYgOr3SoZ86E7okUjFQL+Jx
         VFf5IsBFMGGLxLjD76e9Pozk+qIp2Bx4DDJJt28jQ0/AozfN2caRhVZiZaZW2MkmoWbs
         beKuqZXFOKVXGh7MhQ2WUSfhvQkubbwmswU0gGG0uFcDXhZ9PKaP9iP6twJ6lAkfzEVJ
         4+202/1rrmo9me7adB81FJ/cU2Myc6SyyAOwDui890qOZS53kzGtmjayagvp6pMu6dkT
         X4yPFPAX4ZKzNxTve5G43CLkitAyy0eGZVeN3M6rJhcQj9QCXcSdKc2KuQGWgJM19uE7
         yYog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=ll0H/t4jydC78VeNpK6H1LKSmLXS/IqjTSebEJrorzU=;
        b=khR100vzqhcKREOUnIUDsZDzVCRinDZO2X+lR6osOfVhQofof0uHZG6ih8acINqXAw
         CsxQFWmYA908cj1D9xlLRnqSx3wKeg+44o45Dp7AYIt3CxB6w11GXkUYHpUnSpRsjTQk
         BKA2hqGLfaFduiJtbHdNbsz6Y8uosX74RSE3rRIwFGPg65CdSG806wUv3cZZ/n29L0Co
         iIT6xxCCRdp+eZ98ZvJBmYtlOX22rQq/urxSAhQXvLu9747XzjfYN8ICHMdoiHSWvn0k
         G+dGjK/WCmZTPkE3KgEX1Z0FMDS3davbomzdkpoRNOK0sWtxD2rMSi/2sKa+iLutvzJp
         n3pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t34si3797101qtj.1.2017.10.04.00.41.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 00:41:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33553 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzeJG-0004hy-DX
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 03:41:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dzeJ5-0004hs-Od
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 03:41:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dzeJ2-00066Z-HG
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 03:41:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39372)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1dzeJ2-000664-8M; Wed, 04 Oct 2017 03:41:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A718C2D0D5D;
	Wed,  4 Oct 2017 07:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7A718C2D0D5D
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=cohuck@redhat.com
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9AE615D9CB;
	Wed,  4 Oct 2017 07:41:18 +0000 (UTC)
Date: Wed, 4 Oct 2017 09:41:16 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20171004094116.7537e74e.cohuck@redhat.com>
In-Reply-To: <d64ca97ec0058b24002c387264654b4b322ad7a1.1506730372.git.alistair.francis@xilinx.com>
References: <cover.1506730372.git.alistair.francis@xilinx.com>
	<d64ca97ec0058b24002c387264654b4b322ad7a1.1506730372.git.alistair.francis@xilinx.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 04 Oct 2017 07:41:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 47/47] target: Replace fprintf(stderr,
 "*\n" with error_report()
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
	armbru@redhat.com, Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Yongbok Kim <yongbok.kim@imgtec.com>, alistair23@gmail.com,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AJuqZm+FnSOh

On Fri, 29 Sep 2017 17:17:26 -0700
Alistair Francis <alistair.francis@xilinx.com> wrote:

> Replace a large number of the fprintf(stderr, "*\n" calls with
> error_report(). The functions were renamed with these commands and then
> compiler issues where manually fixed.

> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> index ebb75cafaa..6f7ebd1c98 100644
> --- a/target/s390x/kvm.c
> +++ b/target/s390x/kvm.c
> @@ -967,13 +967,13 @@ static void inject_vcpu_irq_legacy(CPUState *cs, struct kvm_s390_irq *irq)
>  
>      r = s390_kvm_irq_to_interrupt(irq, &kvmint);
>      if (r < 0) {
> -        fprintf(stderr, "%s called with bogus interrupt\n", __func__);
> +        error_report("%s called with bogus interrupt", __func__);
>          exit(1);
>      }
>  
>      r = kvm_vcpu_ioctl(cs, KVM_S390_INTERRUPT, &kvmint);
>      if (r < 0) {
> -        fprintf(stderr, "KVM failed to inject interrupt\n");
> +        error_report("KVM failed to inject interrupt");
>          exit(1);
>      }
>  }
> @@ -1002,13 +1002,13 @@ static void __kvm_s390_floating_interrupt(struct kvm_s390_irq *irq)
>  
>      r = s390_kvm_irq_to_interrupt(irq, &kvmint);
>      if (r < 0) {
> -        fprintf(stderr, "%s called with bogus interrupt\n", __func__);
> +        error_report("%s called with bogus interrupt", __func__);
>          exit(1);
>      }
>  
>      r = kvm_vm_ioctl(kvm_state, KVM_S390_INTERRUPT, &kvmint);
>      if (r < 0) {
> -        fprintf(stderr, "KVM failed to inject interrupt\n");
> +        error_report("KVM failed to inject interrupt");
>          exit(1);
>      }
>  }
> @@ -1116,14 +1116,14 @@ static int handle_b2(S390CPU *cpu, struct kvm_run *run, uint8_t ipa1)
>          break;
>      case PRIV_B2_TSCH:
>          /* We should only get tsch via KVM_EXIT_S390_TSCH. */
> -        fprintf(stderr, "Spurious tsch intercept\n");
> +        error_report("Spurious tsch intercept");
>          break;
>      case PRIV_B2_CHSC:
>          ioinst_handle_chsc(cpu, run->s390_sieic.ipb);
>          break;
>      case PRIV_B2_TPI:
>          /* This should have been handled by kvm already. */
> -        fprintf(stderr, "Spurious tpi intercept\n");
> +        error_report("Spurious tpi intercept");
>          break;
>      case PRIV_B2_SCHM:
>          ioinst_handle_schm(cpu, env->regs[1], env->regs[2],
> @@ -2050,15 +2050,15 @@ static int handle_intercept(S390CPU *cpu)
>              }
>              break;
>          case ICPT_SOFT_INTERCEPT:
> -            fprintf(stderr, "KVM unimplemented icpt SOFT\n");
> +            error_report("KVM unimplemented icpt SOFT");
>              exit(1);
>              break;
>          case ICPT_IO:
> -            fprintf(stderr, "KVM unimplemented icpt IO\n");
> +            error_report("KVM unimplemented icpt IO");
>              exit(1);
>              break;
>          default:
> -            fprintf(stderr, "Unknown intercept code: %d\n", icpt_code);
> +            error_report("Unknown intercept code: %d", icpt_code);
>              exit(1);
>              break;
>      }
> @@ -2215,7 +2215,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>              ret = kvm_arch_handle_debug_exit(cpu);
>              break;
>          default:
> -            fprintf(stderr, "Unknown KVM exit: %d\n", run->exit_reason);
> +            error_report("Unknown KVM exit: %d", run->exit_reason);
>              break;
>      }
>      qemu_mutex_unlock_iothread();
> diff --git a/target/s390x/misc_helper.c b/target/s390x/misc_helper.c
> index 293fc8428a..395872af45 100644
> --- a/target/s390x/misc_helper.c
> +++ b/target/s390x/misc_helper.c
> @@ -354,7 +354,7 @@ uint32_t HELPER(sigp)(CPUS390XState *env, uint64_t order_code, uint32_t r1,
>  #endif
>      default:
>          /* unknown sigp */
> -        fprintf(stderr, "XXX unknown sigp: 0x%" PRIx64 "\n", order_code);
> +        error_report("XXX unknown sigp: 0x%" PRIx64 "", order_code);
>          cc = SIGP_CC_NOT_OPERATIONAL;
>      }
>  

There might be some clashes with David's patches (haven't checked), but
that depends on what goes in first anyway. So, for the s390x parts:

Acked-by: Cornelia Huck <cohuck@redhat.com>
